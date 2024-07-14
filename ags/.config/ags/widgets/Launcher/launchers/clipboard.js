import Launcher from "./base.js";

const ClipboardItem = (item, windowName) =>
  Widget.Button({
    on_clicked: () => {
      App.closeWindow(windowName);
      // app.launch();
    },
    attribute: {
      /** @param {string} text */
      match: () => { }, //(text) => item.match(text ?? ""),
      action: () => { } //item.launch,
    },
    child: Widget.Box({
      spacing: 8,
      children: [
        Widget.Label({
          class_name: "title",
          label: item,
          xalign: 0,
          vpack: "center",
          truncate: "end",
        }),
      ],
    }),
  });

export default function ClipboardLauncher() {
  return Launcher({
    windowName: "clipboardlauncher",
    reloadItems: () => {
      const items = Utils.exec("cliphist list -max-items 30").split("\n")
      console.log(items)
      return items.map((item) => ClipboardItem(item, "clipboardlauncher"));
    },
  });
}
