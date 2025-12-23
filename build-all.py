import argparse
import json
import os
import subprocess

argparse = argparse.ArgumentParser(
    description="Build all OpenSCAD files in subdirectories."
)
argparse.add_argument("--openscad-command", type=str, default="openscad")

args = argparse.parse_args()
OPENSCAD_COMMAND = args.openscad_command

processes = []

def build_one(scad_file, param_set_name=None):
    file_base_name = scad_file.replace(".scad", "")
    extra_args = []
    if param_set_name:
        normalized_name = param_set_name.replace(" ", "-").lower()
        file_base_name += f"-{normalized_name}"

        extra_args.extend(
            [
                "-p",
                scad_file.replace(".scad", ".json"),
                "-P",
                param_set_name,
            ]
        )

    stl_process = subprocess.Popen(
        [
            OPENSCAD_COMMAND,
            "--export-format",
            "binstl",
            "-o",
            f"{file_base_name}.stl",
        ]
        + extra_args
        + [scad_file]
    )
    png_process = subprocess.Popen(
        [
            OPENSCAD_COMMAND,
            "--render",
            "--autocenter",
            "--viewall",
            "-o",
            f"{file_base_name}-preview.png",
        ]
        + extra_args
        + [scad_file]
    )

    processes.append(stl_process)
    processes.append(png_process)


for dir_entry in os.scandir("."):
    if dir_entry.is_dir():
        dir_path = dir_entry.path
        for file_entry in os.scandir(dir_path):
            if file_entry.is_file() and file_entry.name.endswith(".scad"):
                scad_file = file_entry.path
                file_base = scad_file.replace(".scad", "")
                json_file = f"{file_base}.json"

                if not os.path.exists(json_file):
                    build_one(scad_file)
                else:
                    with open(json_file, "r") as jf:
                        param_data = json.load(jf)

                    for param_set_name in param_data["parameterSets"]:
                        build_one(scad_file, param_set_name=param_set_name)

for process in processes:
    process.wait()
