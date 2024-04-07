export default function PopupWindow({ name, anchor, child, childSetup }) {
  const popup = Widget.Window({
    anchor,
    class_names: ["popup"],
    child: child,
    layer: "top",
  });

  const close = Widget.Window({
    css: "background-color: transparent",
    anchor: ["top", "left", "right", "bottom"],
    child: Widget.EventBox({
      on_primary_click: () => {
        App.closeWindow(name);
      },
    }),
    layer: "top",
  });

  const window = Widget.Window({
    name,
    css: "background-color: transparent",
    child: Widget.Box({
      children: [close, popup],
    }),
    setup: (self) => {
      self.keybind("Escape", () => {
        App.closeWindow(name);
      });

      App.applyCss(`${App.configDir}/widgets/style.css`)
      childSetup()
    },
    visible: false,
    keymode: "on-demand",
    layer: "background",
  });

  return window;
}
