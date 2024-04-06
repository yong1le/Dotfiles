import Bar from "./widgets/Bar/bar.js";
import QuickSettings from "./widgets/QuickSettings/settings.js";
import PopupCalendar from "./widgets/Calendar/calendar.js";

App.config({
  style: "./style.css",
  windows: [
    Bar(0),
    // Bar(1),
    QuickSettings(),
    PopupCalendar(),
  ],
});
