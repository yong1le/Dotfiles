import Launcher from "./base.js";

const ClipboardItem = (item, windowName) => {
  const copyText = () => {
    Utils.execAsync([
      "bash",
      "-c",
      `echo "${item}" | cliphist decode | wl-copy`,
    ]);
  };

  return Widget.Button({
    on_clicked: () => {
      App.closeWindow(windowName);
      copyText();
    },
    attribute: {
      /** @param {string} text */
      match: (text) => item.toLowerCase().match(text.toLowerCase() ?? ""),
      action: copyText,
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
};

export default function ClipboardLauncher() {
  return Launcher({
    windowName: "clipboardlauncher",
    reloadItems: () => {
      const items = Utils.exec('bash -c "cliphist list | head -n 30"').split(
        "\n",
      );
      return items.map((item) => ClipboardItem(item, "clipboardlauncher"));
    },
  });
}
