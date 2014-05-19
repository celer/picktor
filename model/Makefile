all: picktor_tool_gear.stl picktor_camera_mount.stl picktor_pump_mount.stl picktor_air_hose_mount.stl picktor_stepper_gear.stl picktor_mount_front.stl picktor_mount_top.stl picktor_mount_bottom.stl

clean:
	rm -rf *.stl

picktor_tool_gear.stl: picktor.scad
	openscad -Dprint_tool_gear=1 picktor.scad -o picktor_tool_gear.stl

picktor_camera_mount.stl: picktor.scad
	openscad -Dprint_camera_mount=1 picktor.scad -o picktor_camera_mount.stl

picktor_pump_mount.stl: picktor.scad
	openscad -Dprint_pump_mount=1 picktor.scad -o picktor_pump_mount.stl

picktor_air_hose_mount.stl: picktor.scad
	openscad -Dprint_air_hose_mount=1 picktor.scad -o picktor_air_hose_mount.stl

picktor_stepper_gear.stl: picktor.scad
	openscad -Dprint_stepper_gear=1 picktor.scad -o picktor_stepper_gear.stl

picktor_mount_front.stl: picktor.scad
	openscad -Dprint_mount_front=1 picktor.scad -o picktor_mount_front.stl

picktor_mount_top.stl: picktor.scad
	openscad -Dprint_mount_top=1 picktor.scad -o picktor_mount_top.stl

picktor_mount_bottom.stl: picktor.scad
	openscad -Dprint_mount_bottom=1 picktor.scad -o picktor_mount_bottom.stl
