{
  "version": "1.2",
  "package": {
    "name": "ov7670_rgb_yuv",
    "version": "1.1",
    "description": "Configures ov7670 in either RGB444 or YUV and shows it",
    "author": "Felipe Machado",
    "image": ""
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "5762721f-d258-4a65-8e56-b9e74c98972a",
          "type": "basic.output",
          "data": {
            "name": "ss",
            "pins": [
              {
                "index": "0",
                "name": "D4",
                "value": "8"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 568,
            "y": -440
          }
        },
        {
          "id": "629f8b48-a6c0-4bd0-b04e-9bc99d550f5f",
          "type": "basic.input",
          "data": {
            "name": "rst",
            "pins": [
              {
                "index": "0",
                "name": "SW1",
                "value": "34"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -176,
            "y": -424
          }
        },
        {
          "id": "408c4263-1fd9-477e-866e-b522753745e4",
          "type": "basic.output",
          "data": {
            "name": "sclk",
            "pins": [
              {
                "index": "0",
                "name": "D0",
                "value": "2"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1120,
            "y": -288
          }
        },
        {
          "id": "39dbf40a-f91e-47a8-82ff-4f76416acabf",
          "type": "basic.output",
          "data": {
            "name": "mosi_o",
            "pins": [
              {
                "index": "0",
                "name": "D2",
                "value": "4"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1112,
            "y": -200
          }
        },
        {
          "id": "5d4099f3-f1ad-4f9f-8076-9e27369c9b9e",
          "type": "basic.output",
          "data": {
            "name": "rpi_running",
            "pins": [
              {
                "index": "0",
                "name": "D3",
                "value": "3"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1112,
            "y": -112
          }
        },
        {
          "id": "7a55fc31-5d15-4bca-8b14-93101f389387",
          "type": "basic.input",
          "data": {
            "name": "miso",
            "pins": [
              {
                "index": "0",
                "name": "D1",
                "value": "1"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 808,
            "y": 72
          }
        },
        {
          "id": "2dc732a5-b189-4835-bd8b-81594ce2f640",
          "type": "1e3e2fe589ecba428455b3f167a8e84edb4c218b",
          "position": {
            "x": 352,
            "y": -328
          },
          "size": {
            "width": 96,
            "height": 288
          }
        },
        {
          "id": "2e4462be-a255-413e-bfcf-be22fb521a8d",
          "type": "2efe39da646c359984049ea063338769e484bb63",
          "position": {
            "x": 912,
            "y": -360
          },
          "size": {
            "width": 96,
            "height": 224
          }
        },
        {
          "id": "fed6a17d-60da-421c-bf3b-e490c6ac5d71",
          "type": "basic.code",
          "data": {
            "code": "assign vel = 8'd40;",
            "params": [],
            "ports": {
              "in": [],
              "out": [
                {
                  "name": "vel",
                  "range": "[7:0]",
                  "size": 8
                }
              ]
            }
          },
          "position": {
            "x": -192,
            "y": -296
          },
          "size": {
            "width": 232,
            "height": 64
          }
        },
        {
          "id": "6d96d919-f5fc-49f3-9aa1-4ace6ae960ee",
          "type": "basic.code",
          "data": {
            "code": "assign led = 24'hff0000;",
            "params": [],
            "ports": {
              "in": [],
              "out": [
                {
                  "name": "led",
                  "range": "[23:0]",
                  "size": 24
                }
              ]
            }
          },
          "position": {
            "x": -200,
            "y": -176
          },
          "size": {
            "width": 232,
            "height": 64
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "629f8b48-a6c0-4bd0-b04e-9bc99d550f5f",
            "port": "out"
          },
          "target": {
            "block": "2dc732a5-b189-4835-bd8b-81594ce2f640",
            "port": "fff8810d-4cef-42d3-8896-8c9e4a496379"
          },
          "vertices": [
            {
              "x": 0,
              "y": -344
            }
          ]
        },
        {
          "source": {
            "block": "629f8b48-a6c0-4bd0-b04e-9bc99d550f5f",
            "port": "out"
          },
          "target": {
            "block": "2e4462be-a255-413e-bfcf-be22fb521a8d",
            "port": "cfbf8498-f0bc-4fb0-bc44-1a03a9e83e9c"
          },
          "vertices": [
            {
              "x": 656,
              "y": -312
            }
          ]
        },
        {
          "source": {
            "block": "2dc732a5-b189-4835-bd8b-81594ce2f640",
            "port": "e86e026a-227d-4bf8-8c70-53ea31e04a3c"
          },
          "target": {
            "block": "2e4462be-a255-413e-bfcf-be22fb521a8d",
            "port": "f19e3f2e-32c6-4629-942e-f88704750d9d"
          },
          "vertices": [
            {
              "x": 632,
              "y": -192
            }
          ]
        },
        {
          "source": {
            "block": "2dc732a5-b189-4835-bd8b-81594ce2f640",
            "port": "d34cf187-214e-4ae8-9603-3c41146647e3"
          },
          "target": {
            "block": "2e4462be-a255-413e-bfcf-be22fb521a8d",
            "port": "fd93ee0e-cc6f-4386-8d45-28d9ac257767"
          },
          "vertices": [
            {
              "x": 672,
              "y": -248
            }
          ]
        },
        {
          "source": {
            "block": "2dc732a5-b189-4835-bd8b-81594ce2f640",
            "port": "bbd54035-423d-4fa2-82ca-59b83d57b3e9"
          },
          "target": {
            "block": "2e4462be-a255-413e-bfcf-be22fb521a8d",
            "port": "7c071aa2-1f78-462c-bbf1-b07283922ed1"
          },
          "vertices": [
            {
              "x": 664,
              "y": -112
            }
          ],
          "size": 8
        },
        {
          "source": {
            "block": "2e4462be-a255-413e-bfcf-be22fb521a8d",
            "port": "fdc0b9ae-45ae-4285-86c8-6f8a66d97fb6"
          },
          "target": {
            "block": "2dc732a5-b189-4835-bd8b-81594ce2f640",
            "port": "a9a0f2c3-60e8-49c7-90c8-ee81b695e8a4"
          },
          "vertices": [
            {
              "x": 480,
              "y": -496
            },
            {
              "x": 288,
              "y": -464
            }
          ]
        },
        {
          "source": {
            "block": "2e4462be-a255-413e-bfcf-be22fb521a8d",
            "port": "50e235e2-3385-4dc2-869c-a29a300b39be"
          },
          "target": {
            "block": "408c4263-1fd9-477e-866e-b522753745e4",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "2e4462be-a255-413e-bfcf-be22fb521a8d",
            "port": "3518615b-f740-4450-b702-e0eddcdcb7e4"
          },
          "target": {
            "block": "39dbf40a-f91e-47a8-82ff-4f76416acabf",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "2e4462be-a255-413e-bfcf-be22fb521a8d",
            "port": "3f8d97c2-b88b-4c8d-b717-480bf7b36b52"
          },
          "target": {
            "block": "5d4099f3-f1ad-4f9f-8076-9e27369c9b9e",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "2dc732a5-b189-4835-bd8b-81594ce2f640",
            "port": "50262b52-dd70-4386-94f6-b41d4259401d"
          },
          "target": {
            "block": "5762721f-d258-4a65-8e56-b9e74c98972a",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "7a55fc31-5d15-4bca-8b14-93101f389387",
            "port": "out"
          },
          "target": {
            "block": "2e4462be-a255-413e-bfcf-be22fb521a8d",
            "port": "6fd30186-e930-4605-8b97-b02c1302684e"
          }
        },
        {
          "source": {
            "block": "6d96d919-f5fc-49f3-9aa1-4ace6ae960ee",
            "port": "led"
          },
          "target": {
            "block": "2dc732a5-b189-4835-bd8b-81594ce2f640",
            "port": "e20802df-0fbb-48e6-b5d4-89a3ab66a171"
          },
          "size": 24
        },
        {
          "source": {
            "block": "fed6a17d-60da-421c-bf3b-e490c6ac5d71",
            "port": "vel"
          },
          "target": {
            "block": "2dc732a5-b189-4835-bd8b-81594ce2f640",
            "port": "bbc89353-68a5-4b76-8fbb-c196bdaf2dde"
          },
          "size": 8
        }
      ]
    }
  },
  "dependencies": {
    "1e3e2fe589ecba428455b3f167a8e84edb4c218b": {
      "package": {
        "name": "GPG Control ",
        "version": "",
        "description": "",
        "author": "rnicklas",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "fff8810d-4cef-42d3-8896-8c9e4a496379",
              "type": "basic.input",
              "data": {
                "name": "rst",
                "clock": false
              },
              "position": {
                "x": -120,
                "y": 144
              }
            },
            {
              "id": "50262b52-dd70-4386-94f6-b41d4259401d",
              "type": "basic.output",
              "data": {
                "name": "spi_ss_n",
                "virtual": false
              },
              "position": {
                "x": 832,
                "y": 176
              }
            },
            {
              "id": "5db2bf01-b245-4887-b6bd-5c20bcc01c8b",
              "type": "basic.input",
              "data": {
                "name": "clk",
                "clock": true
              },
              "position": {
                "x": -120,
                "y": 200
              }
            },
            {
              "id": "a9a0f2c3-60e8-49c7-90c8-ee81b695e8a4",
              "type": "basic.input",
              "data": {
                "name": "busy_spi",
                "clock": false
              },
              "position": {
                "x": -120,
                "y": 248
              }
            },
            {
              "id": "d34cf187-214e-4ae8-9603-3c41146647e3",
              "type": "basic.output",
              "data": {
                "name": "spi_send",
                "virtual": false
              },
              "position": {
                "x": 824,
                "y": 296
              }
            },
            {
              "id": "bbc89353-68a5-4b76-8fbb-c196bdaf2dde",
              "type": "basic.input",
              "data": {
                "name": "motor_pwm_left_i",
                "range": "[7:0]",
                "pins": [
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": false,
                "clock": false
              },
              "position": {
                "x": -120,
                "y": 304
              }
            },
            {
              "id": "3c1f8a9d-1ff2-4dd1-8c1f-ba07ef274c80",
              "type": "basic.input",
              "data": {
                "name": "motor_pwm_rght_i",
                "range": "[7:0]",
                "pins": [
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": false,
                "clock": false
              },
              "position": {
                "x": -128,
                "y": 360
              }
            },
            {
              "id": "e86e026a-227d-4bf8-8c70-53ea31e04a3c",
              "type": "basic.output",
              "data": {
                "name": "ena_2clk"
              },
              "position": {
                "x": 824,
                "y": 416
              }
            },
            {
              "id": "0395c4a7-859a-4bee-94a6-9a2642c9606e",
              "type": "basic.input",
              "data": {
                "name": "led_eye_left_rgb_i",
                "range": "[23:0]",
                "pins": [
                  {
                    "index": "23",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "22",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "21",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "20",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "19",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "18",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "17",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "16",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": false,
                "clock": false
              },
              "position": {
                "x": -136,
                "y": 416
              }
            },
            {
              "id": "e6c85cad-f473-4ceb-8de7-9a58743709bc",
              "type": "basic.input",
              "data": {
                "name": "led_eye_rght_rgb_i",
                "range": "[23:0]",
                "pins": [
                  {
                    "index": "23",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "22",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "21",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "20",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "19",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "18",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "17",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "16",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": false,
                "clock": false
              },
              "position": {
                "x": -136,
                "y": 464
              }
            },
            {
              "id": "065ed119-dca7-4790-b4a1-f6ffe79050ca",
              "type": "basic.input",
              "data": {
                "name": "led_blink_left_rgb_i",
                "range": "[23:0]",
                "pins": [
                  {
                    "index": "23",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "22",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "21",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "20",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "19",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "18",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "17",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "16",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": false,
                "clock": false
              },
              "position": {
                "x": -136,
                "y": 512
              }
            },
            {
              "id": "bbd54035-423d-4fa2-82ca-59b83d57b3e9",
              "type": "basic.output",
              "data": {
                "name": "data_spi",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 832,
                "y": 536
              }
            },
            {
              "id": "e20802df-0fbb-48e6-b5d4-89a3ab66a171",
              "type": "basic.input",
              "data": {
                "name": "led_blink_rght_rgb_i",
                "range": "[23:0]",
                "pins": [
                  {
                    "index": "23",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "22",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "21",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "20",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "19",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "18",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "17",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "16",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": false,
                "clock": false
              },
              "position": {
                "x": -136,
                "y": 560
              }
            },
            {
              "id": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
              "type": "basic.code",
              "data": {
                "code": "// @include spi_ledctrl.v\r\n\r\n  spi_ledctrl i_spi_ledctrl\r\n  (\r\n    .rst         (rst),\r\n    .clk         (clk),\r\n    .busy_spi    (busy_spi),\r\n    .motor_pwm_left_i     (motor_pwm_left_i),\r\n    .motor_pwm_rght_i     (motor_pwm_rght_i),\r\n    .led_eye_left_rgb_i   (led_eye_left_rgb_i),\r\n    .led_eye_rght_rgb_i   (led_eye_rght_rgb_i),\r\n    .led_blink_left_rgb_i (led_blink_left_rgb_i),\r\n    .led_blink_rght_rgb_i (led_blink_rght_rgb_i),\r\n    .spi_ss_n    (spi_ss_n), // spi slave select\r\n    .spi_send    (spi_send),\r\n    .ena_2clk    (ena_2clk),\r\n    .data_spi    (data_spi)\r\n  );\r\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "rst"
                    },
                    {
                      "name": "clk"
                    },
                    {
                      "name": "busy_spi"
                    },
                    {
                      "name": "motor_pwm_left_i",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "motor_pwm_rght_i",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "led_eye_left_rgb_i",
                      "range": "[23:0]",
                      "size": 24
                    },
                    {
                      "name": "led_eye_rght_rgb_i",
                      "range": "[23:0]",
                      "size": 24
                    },
                    {
                      "name": "led_blink_left_rgb_i",
                      "range": "[23:0]",
                      "size": 24
                    },
                    {
                      "name": "led_blink_rght_rgb_i",
                      "range": "[23:0]",
                      "size": 24
                    }
                  ],
                  "out": [
                    {
                      "name": "spi_ss_n"
                    },
                    {
                      "name": "spi_send"
                    },
                    {
                      "name": "ena_2clk"
                    },
                    {
                      "name": "data_spi",
                      "range": "[7:0]",
                      "size": 8
                    }
                  ]
                }
              },
              "position": {
                "x": 192,
                "y": 152
              },
              "size": {
                "width": 552,
                "height": 472
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "5db2bf01-b245-4887-b6bd-5c20bcc01c8b",
                "port": "out"
              },
              "target": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "fff8810d-4cef-42d3-8896-8c9e4a496379",
                "port": "out"
              },
              "target": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "rst"
              }
            },
            {
              "source": {
                "block": "a9a0f2c3-60e8-49c7-90c8-ee81b695e8a4",
                "port": "out"
              },
              "target": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "busy_spi"
              }
            },
            {
              "source": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "ena_2clk"
              },
              "target": {
                "block": "e86e026a-227d-4bf8-8c70-53ea31e04a3c",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "data_spi"
              },
              "target": {
                "block": "bbd54035-423d-4fa2-82ca-59b83d57b3e9",
                "port": "in"
              },
              "size": 8
            },
            {
              "source": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "spi_send"
              },
              "target": {
                "block": "d34cf187-214e-4ae8-9603-3c41146647e3",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "spi_ss_n"
              },
              "target": {
                "block": "50262b52-dd70-4386-94f6-b41d4259401d",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "bbc89353-68a5-4b76-8fbb-c196bdaf2dde",
                "port": "out"
              },
              "target": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "motor_pwm_left_i"
              },
              "size": 8
            },
            {
              "source": {
                "block": "3c1f8a9d-1ff2-4dd1-8c1f-ba07ef274c80",
                "port": "out"
              },
              "target": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "motor_pwm_rght_i"
              },
              "size": 8
            },
            {
              "source": {
                "block": "0395c4a7-859a-4bee-94a6-9a2642c9606e",
                "port": "out"
              },
              "target": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "led_eye_left_rgb_i"
              },
              "size": 24
            },
            {
              "source": {
                "block": "e6c85cad-f473-4ceb-8de7-9a58743709bc",
                "port": "out"
              },
              "target": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "led_eye_rght_rgb_i"
              },
              "size": 24
            },
            {
              "source": {
                "block": "065ed119-dca7-4790-b4a1-f6ffe79050ca",
                "port": "out"
              },
              "target": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "led_blink_left_rgb_i"
              },
              "size": 24
            },
            {
              "source": {
                "block": "e20802df-0fbb-48e6-b5d4-89a3ab66a171",
                "port": "out"
              },
              "target": {
                "block": "b4e7bdea-88b7-4a43-a26d-f3cde8c7a4e2",
                "port": "led_blink_rght_rgb_i"
              },
              "size": 24
            }
          ]
        }
      }
    },
    "2efe39da646c359984049ea063338769e484bb63": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "e7cb9381-4164-4c25-ba00-72c37df2df31",
              "type": "basic.input",
              "data": {
                "name": "clk",
                "clock": true
              },
              "position": {
                "x": -176,
                "y": 136
              }
            },
            {
              "id": "fdc0b9ae-45ae-4285-86c8-6f8a66d97fb6",
              "type": "basic.output",
              "data": {
                "name": "busy_spi"
              },
              "position": {
                "x": 904,
                "y": 144
              }
            },
            {
              "id": "cfbf8498-f0bc-4fb0-bc44-1a03a9e83e9c",
              "type": "basic.input",
              "data": {
                "name": "rst",
                "clock": false
              },
              "position": {
                "x": -200,
                "y": 184
              }
            },
            {
              "id": "f19e3f2e-32c6-4629-942e-f88704750d9d",
              "type": "basic.input",
              "data": {
                "name": "ena_2clk",
                "clock": false
              },
              "position": {
                "x": -200,
                "y": 240
              }
            },
            {
              "id": "fd93ee0e-cc6f-4386-8d45-28d9ac257767",
              "type": "basic.input",
              "data": {
                "name": "start",
                "clock": false
              },
              "position": {
                "x": -216,
                "y": 304
              }
            },
            {
              "id": "50e235e2-3385-4dc2-869c-a29a300b39be",
              "type": "basic.output",
              "data": {
                "name": "sclk_o"
              },
              "position": {
                "x": 920,
                "y": 328
              }
            },
            {
              "id": "7c071aa2-1f78-462c-bbf1-b07283922ed1",
              "type": "basic.input",
              "data": {
                "name": "data_spi",
                "range": "[7:0]",
                "clock": false,
                "size": 8
              },
              "position": {
                "x": -208,
                "y": 384
              }
            },
            {
              "id": "af6f65e2-a2a6-49c8-a6d7-f27154f3cc76",
              "type": "basic.input",
              "data": {
                "name": "ack",
                "clock": false
              },
              "position": {
                "x": -56,
                "y": 456
              }
            },
            {
              "id": "3518615b-f740-4450-b702-e0eddcdcb7e4",
              "type": "basic.output",
              "data": {
                "name": "mosi_o"
              },
              "position": {
                "x": 912,
                "y": 480
              }
            },
            {
              "id": "3f8d97c2-b88b-4c8d-b717-480bf7b36b52",
              "type": "basic.output",
              "data": {
                "name": "rpi_run"
              },
              "position": {
                "x": 856,
                "y": 552
              }
            },
            {
              "id": "6fd30186-e930-4605-8b97-b02c1302684e",
              "type": "basic.input",
              "data": {
                "name": "miso_i",
                "clock": false
              },
              "position": {
                "x": -216,
                "y": 576
              }
            },
            {
              "id": "686efab2-218f-40e8-a203-454f35652261",
              "type": "basic.code",
              "data": {
                "code": "// @include spi_master.v\r\n \r\n  SPI_Master i_spi_master\r\n   (\r\n    // System\r\n    .clk_i      (clk),\r\n    .rst_i      (rst),\r\n    .ena_i      (ena_2clk),  // 2*SCK\r\n    // Interface\r\n    .start_i    (start),\r\n    .ack_i      (ack),  // IRQ Ack\r\n    .tx_i       (data_spi),\r\n    .busy_o     (busy_spi), \r\n\r\n    // SPI\r\n    .sclk_o     (sclk_o), \r\n    .miso_i     (miso_i),\r\n    //.mosi_en_o  (ssb), \r\n    .mosi_o     (mosi_o),\r\n    .rpi_running (rpi_running)\r\n   );\r\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "rst"
                    },
                    {
                      "name": "ena_2clk"
                    },
                    {
                      "name": "start"
                    },
                    {
                      "name": "data_spi",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "ack"
                    },
                    {
                      "name": "miso_i"
                    }
                  ],
                  "out": [
                    {
                      "name": "busy_spi"
                    },
                    {
                      "name": "sclk_o"
                    },
                    {
                      "name": "mosi_o"
                    },
                    {
                      "name": "rpi_running"
                    }
                  ]
                }
              },
              "position": {
                "x": 208,
                "y": 144
              },
              "size": {
                "width": 544,
                "height": 448
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "e7cb9381-4164-4c25-ba00-72c37df2df31",
                "port": "out"
              },
              "target": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "cfbf8498-f0bc-4fb0-bc44-1a03a9e83e9c",
                "port": "out"
              },
              "target": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "rst"
              }
            },
            {
              "source": {
                "block": "f19e3f2e-32c6-4629-942e-f88704750d9d",
                "port": "out"
              },
              "target": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "ena_2clk"
              }
            },
            {
              "source": {
                "block": "fd93ee0e-cc6f-4386-8d45-28d9ac257767",
                "port": "out"
              },
              "target": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "start"
              }
            },
            {
              "source": {
                "block": "7c071aa2-1f78-462c-bbf1-b07283922ed1",
                "port": "out"
              },
              "target": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "data_spi"
              },
              "vertices": [
                {
                  "x": -56,
                  "y": 368
                }
              ],
              "size": 8
            },
            {
              "source": {
                "block": "af6f65e2-a2a6-49c8-a6d7-f27154f3cc76",
                "port": "out"
              },
              "target": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "ack"
              }
            },
            {
              "source": {
                "block": "6fd30186-e930-4605-8b97-b02c1302684e",
                "port": "out"
              },
              "target": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "miso_i"
              }
            },
            {
              "source": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "busy_spi"
              },
              "target": {
                "block": "fdc0b9ae-45ae-4285-86c8-6f8a66d97fb6",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "sclk_o"
              },
              "target": {
                "block": "50e235e2-3385-4dc2-869c-a29a300b39be",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "mosi_o"
              },
              "target": {
                "block": "3518615b-f740-4450-b702-e0eddcdcb7e4",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "686efab2-218f-40e8-a203-454f35652261",
                "port": "rpi_running"
              },
              "target": {
                "block": "3f8d97c2-b88b-4c8d-b717-480bf7b36b52",
                "port": "in"
              }
            }
          ]
        }
      }
    }
  }
}