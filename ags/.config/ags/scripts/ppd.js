const powerprofiles = await Service.import("powerprofiles");

export const switchPPD = () => {
  switch (powerprofiles.active_profile) {
    case "balanced":
      powerprofiles.active_profile = "performance";
      break;
    case "performance":
      powerprofiles.active_profile = "power-saver";
      break;
    default:
      powerprofiles.active_profile = "balanced";
      break;
  }
};
