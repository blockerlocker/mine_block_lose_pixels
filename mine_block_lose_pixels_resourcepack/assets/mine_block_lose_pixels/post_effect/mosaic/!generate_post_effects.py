import os
import json
from pathlib import Path

abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)

template = {
    "targets": {
        "swap": {}
    },
    "passes": [
        {
            "vertex_shader": "minecraft:core/screenquad",
            "fragment_shader": "mine_block_lose_pixels:post/mosaic",
            "inputs": [
                {
                    "sampler_name": "In",
                    "target": "minecraft:main",
                    "bilinear": True
                }
            ],
            "output": "minecraft:main",
            "uniforms": {
                "BitsConfig": [
                    {
                        "name": "MosaicSize",
                        "type": "float",
                        "value": 2.0
                    }
                ]
            }
        }
    ]
}

for i in range (2,512):
    new_file = template
    new_file["passes"][0]["uniforms"]["BitsConfig"][0]["value"] = float(i)

    new_path = str(i)+".json"

    with open(new_path, "w") as json_file:
        json.dump(new_file, json_file)