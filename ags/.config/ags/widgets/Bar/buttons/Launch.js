export function LaunchButton() {
  return Widget.Button({
    on_primary_click: () =>
      Utils.subprocess(["wofi", "--show", "drun"], () => {}),
    on_secondary_click: () => Utils.subprocess(["killall", "wofi"], () => {}),
    child: Widget.Icon({
      icon: "starred-symbolic",
    }),
  });
}
