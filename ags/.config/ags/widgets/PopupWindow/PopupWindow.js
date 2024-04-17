export default function PopupWindow({ name, anchor, child, childSetup }) {
  const popup = Widget.Window({
    anchor,
    class_names: ["popup"],
    child: child,
    layer: "overlay",
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
    css: "background-color: transparent; min-height: 0px; min-width: 0px",
    anchor: ["top", "right"],
    child: Widget.Box({
      children: [close, popup],
    }),
    setup: (self) => {
      App.applyCss(`${App.configDir}/widgets/PopupWindow/PopupWindow.css`);
      childSetup(self);
    },
    visible: false,
  });

  return window;
}
