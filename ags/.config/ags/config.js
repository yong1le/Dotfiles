import Bar from "./widgets/Bar/bar.js";
import ControlCentre from "./widgets/ControlCentre/ControlCentre.js";
// import PopupCalendar from "./widgets/Calendar/calendar.js";

App.config({
  style: "./style.css",
  windows: [
    Bar(0),
    Bar(1),
    ControlCentre(),
    // PopupCalendar(),
  ],
});
