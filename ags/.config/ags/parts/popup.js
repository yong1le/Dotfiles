export default function PopupWindow({ name, anchor, child }) {
  return Widget.Window({
    class_names: ["popup"],
    name,
    anchor,
    child,
    setup: (self) => {
      self.keybind("Escape", () => {
        App.closeWindow(name);
      });
    },
    visible: false,
    keymode: "on-demand",
  });
}
