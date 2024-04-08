const hyprland = await Service.import("hyprland");

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
          on_clicked: () => hyprland.messageAsync(`dispatch workspace ${e.id}`),
          child: Widget.Label(e.id == e.name ? `${e.id}`: `${e.id} ${e.name}`),
          class_name: activeId.as((i) => `${i === e.id ? "focused" : ""}`),
        }),
      ),
  );

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces,
  });
}

