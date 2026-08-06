import { spawnSync } from "node:child_process"
import { mkdirSync, rmSync, writeFileSync } from "node:fs"
import { join } from "node:path"
import type { Plugin } from "@opencode-ai/plugin"

const STATE_DIR = "/tmp/tmux-opencode"
type State = "blocked" | "thinking" | "ready"

export const TmuxStatusPlugin: Plugin = async () => {
  const stateFile = resolveStateFile()
  if (!stateFile) return {}

  let busy = false
  let pendingPermissions = 0

  const writeState = () => {
    const state: State = pendingPermissions > 0 ? "blocked" : busy ? "thinking" : "ready"
    try {
      mkdirSync(STATE_DIR, { recursive: true })
      writeFileSync(stateFile, `${state} ${process.pid}\n`)
    } catch {
      // tmux not available; nothing to update
    }
  }

  writeState()
  process.on("exit", () => rmSync(stateFile, { force: true }))

  return {
    event: async ({ event }) => {
      switch (event.type) {
        case "session.status": {
          const { status } = event.properties
          if (status.type === "busy" || status.type === "retry") busy = true
          else if (status.type === "idle") busy = false
          writeState()
          break
        }
        case "session.idle":
          busy = false
          writeState()
          break
        default: {
          const type = (event as { type: string }).type
          if (type === "permission.asked" || type === "permission.v2.asked") {
            pendingPermissions++
            writeState()
          } else if (type === "permission.replied" || type === "permission.v2.replied") {
            pendingPermissions = Math.max(0, pendingPermissions - 1)
            writeState()
          }
        }
      }
    },
  }
}

function resolveStateFile(): string | undefined {
  const paneID = process.env.TMUX_PANE
  if (!paneID) return undefined

  const res = spawnSync(
    "tmux",
    ["display-message", "-p", "-t", paneID, "#{window_index} #{pane_index}"],
    { encoding: "utf8" },
  )
  if (res.status !== 0) return undefined

  const [windowIndex, paneIndex] = (res.stdout ?? "").trim().split(/\s+/)
  if (!windowIndex || !paneIndex) return undefined
  return join(STATE_DIR, `state-${paneIndex}-${windowIndex}`)
}
