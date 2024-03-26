export default function PopupWindow({ name, anchor, child }) {
  const close = Widget.Window({
    anchor: ["top", "right", "left", "bottom"],
    css: "background-color: transparent",
    child: Widget.EventBox({
      on_primary_click: () => {
        App.closeWindow(name);
      },
    }),
  });

  const window = Widget.Window({
    class_names: ["popup"],
    name,
    anchor,
    child: Widget.Box({
      children: [child, close],
    }),
    setup: (self) => {
      self.keybind("Escape", () => {
        App.closeWindow(name);
      });
    },
    layer: "top",
    visible: false,
    keymode: "on-demand",
  });

  return window;
}
