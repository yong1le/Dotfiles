import PopupWindow from "../PopupWindow/PopupWindow.js";

const WINDOW_NAME = "popupcalendar";

const Calendar = () => {
  return Widget.Box({
    className: "popup-inner",
    child: Widget.Calendar({
      showDayNames: true,
      showDetails: true,
      showHeading: true,
      showWeekNumbers: false,
    }),
  });
};

export default function PopupCalendar() {
  return PopupWindow({
    name: WINDOW_NAME,
    anchor: ["top"],
    child: Calendar(),
    childSetup: () => {},
  });
}
