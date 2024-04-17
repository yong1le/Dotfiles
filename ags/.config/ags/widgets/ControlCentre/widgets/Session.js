function Poweroff() {
  return Widget.Button({
    on_clicked: () => Utils.exec("systemctl poweroff"),
    child: Widget.Icon({
      icon: "system-shutdown-symbolic",
    }),
  });
}

function Restart() {
  return Widget.Button({
    on_clicked: () => Utils.exec("systemctl reboot"),
    child: Widget.Icon({
      icon: "system-reboot-symbolic",
    }),
  });
}

function Logout() {
  return Widget.Button({
    on_clicked: () => Utils.exec("loginctl lock-session"),
    child: Widget.Icon({
      icon: "system-log-out-symbolic",
    }),
  });
}

function Suspend() {
  return Widget.Button({
    on_clicked: () => Utils.exec("systemctl suspend"),
    child: Widget.Icon({
      icon: "media-playback-stop-symbolic",
    }),
  });
}

export function Session() {
  return Widget.Box({
    spacing: 10,
    vpack: "center",
    hpack: "end",
    vertical: true,
    children: [
      Widget.Box({
        spacing: 10,
        children: [Poweroff(), Restart()],
      }),

      Widget.Box({
        spacing: 10,
        children: [Logout(), Suspend()],
      }),
    ],
  });
}
