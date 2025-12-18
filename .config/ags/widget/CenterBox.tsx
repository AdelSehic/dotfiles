import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"

export default function CenterBox() {
  return (
    <button onClicked={(self) => console.log(self, "clicked")}>
      <label label="Click me!" />
    </button>
  )
}
