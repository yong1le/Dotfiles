const hyprland = await Service.import("hyprland");
const dispatch = (ws) => hyprland.messageAsync(`dispatch workspace ${ws}`);

/**
 * @param {number} monitor
 */
export function Workspaces(monitor) {
  const activeId = hyprland.active.workspace.bind("id");
  const workspaces = hyprland.bind("workspaces").as((ws) =>
    ws
      .filter((e) => e.monitorID === monitor && e.id > 0)
      .sort((a, b) => a.id - b.id)
      .map((e) =>
        Widget.Button({
          cursor: "pointer",
          on_clicked: () => hyprland.messageAsync(`dispatch workspace ${e.id}`),
          child: Widget.Label(e.id == e.name ? `${e.id}` : `${e.id} ${e.name}`),
          class_name: activeId.as((i) => `${i === e.id ? "focused" : ""}`),
        }),
      ),
  );

  return Widget.EventBox({
    class_name: "workspaces",
    onScrollUp: () => dispatch("+1"),
    onScrollDown: () => dispatch("-1"),
    child: Widget.Box({
      children: workspaces,
    }),
  });
}

export function Title() {
  return Widget.Label({
    label: hyprland.active.bind("client").as((a) => `${a.title}`),
  });
}
