import { Notification } from "../../Notification/Notification.js";

const notifications = await Service.import("notifications");

const Clear = () => {
  return Widget.Button({
    on_clicked: () => notifications.clear(),
    child: Widget.Label({
      label: "Clear All",
    }),
  });
};

export const NotificationHeader = () => {
  return Widget.Box({
    children: [
      Widget.Label({
        className: "label",
        hexpand: true,
        hpack: "start",
        label: "Notifications",
      }),
      Clear(),
    ],
  });
};

export const NotificationCenter = () => {
  return Widget.Box({
    vertical: true,
    vexpand: true,
    children: notifications
      .bind("notifications")
      .as((n) => n.map(Notification)),
  });
};
