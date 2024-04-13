export default function PopupWindow({ name, anchor, child, childSetup }) {
  const popup = Widget.Window({
    anchor,
    name,
    setup: (self) => {
      self.keybind("Escape", () => {
        App.closeWindow(name);
      });

      App.applyCss(`${App.configDir}/widgets/PopupWindow/PopupWindow.css`);
      childSetup(self);
    },
    class_names: ["popup"],
    child: child,
    keymode: "on-demand",
    visible: false,
    layer: "overlay",
  });

  return popup;
}
