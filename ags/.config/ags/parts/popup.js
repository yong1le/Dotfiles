export default function PopupWindow({ name, anchor, child }) {
  const window = Widget.Window({
    class_names: ["popup"],
    name,
    anchor,
    child,
    setup: (self) => {
      self.keybind("Escape", () => {
        App.closeWindow(name);
        // App.closeWindow(name);
      });
      App.openWindow("popupcloser")
    },
    layer: "top",
    visible: false,
    keymode: "on-demand",
  });

  // const fullScreen = Widget.Window({
  //   anchor: ["top", "left", "right", "bottom"],
  //   css: `background-color: transparent`,
  //   child: Widget.EventBox({
  //     on_primary_click: () => App.closeWindow(name),
  //     child: window
  //   }),
  //   visible: false,
  // })
  //
  
  return window;
}
