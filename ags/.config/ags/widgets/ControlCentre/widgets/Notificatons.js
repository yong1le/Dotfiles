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

// const DND = () => {
//   return Widget.Box({
//     children: [
//       Widget.Switch({
//         state: notifications.bind("dnd"),
//         on_activate: ({active}) => notifications.dnd = active
//       })
//     ]
//   })
// }

export const NotificationHeader = () => {
  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Label({
        className: "label",
        hexpand: true,
        hpack: "start",
        label: "Notifications",
      }),
      // DND(),
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
