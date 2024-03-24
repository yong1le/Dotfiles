const WINDOW_NAME = "popupcalendar";

const Calendar = () => {
  return Widget.Calendar({
    showDayNames: true,
    showDetails: true,
    showHeading: true,
    showWeekNumbers: true,
  });
};

export default function PopupCalendar() {
  return Widget.Window({
    name: WINDOW_NAME,
    anchor: ["top", "right"],
    setup: (self) =>
      self.keybind("Escape", () => {
        App.closeWindow(WINDOW_NAME);
      }),
    visible: false,
    keymode: "exclusive",
    child: Calendar(),
  });
}
