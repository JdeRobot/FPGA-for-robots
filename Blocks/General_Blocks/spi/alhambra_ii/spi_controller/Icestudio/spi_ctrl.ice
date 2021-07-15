{
  "version": "1.2",
  "package": {
    "name": "GoPiGo Controller ",
    "version": "1.0",
    "description": "",
    "author": "JdeRobot",
    "image": ""
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "7be2ddb1-d6a1-4bd7-ae61-39bfb790c83a",
          "type": "basic.input",
          "data": {
            "name": "rst",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": 96,
            "y": 208
          }
        },
        {
          "id": "69dc2722-2a9d-4126-b109-7e31cfea16b6",
          "type": "basic.output",
          "data": {
            "name": "spi_ss_n",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 968,
            "y": 224
          }
        },
        {
          "id": "a1e8c8a0-be11-4a4d-a19e-f8ee03fa17ae",
          "type": "basic.input",
          "data": {
            "name": "clk",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "clock": true
          },
          "position": {
            "x": -40,
            "y": 256
          }
        },
        {
          "id": "27b9b159-fff3-4aa8-a549-d95bf7cffa35",
          "type": "basic.input",
          "data": {
            "name": "busy_spi",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": 88,
            "y": 296
          }
        },
        {
          "id": "252056ef-9e93-4572-9542-6c05ab5014f3",
          "type": "basic.output",
          "data": {
            "name": "spi_send",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 984,
            "y": 344
          }
        },
        {
          "id": "30efe8a5-78b5-4d54-9240-38fe50b23cf7",
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
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -96,
            "y": 352
          }
        },
        {
          "id": "d9089370-ca82-4916-a658-332acf5559d7",
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
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -96,
            "y": 400
          }
        },
        {
          "id": "76d276fd-4d90-4f03-8e17-82b1cebc95b0",
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
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -104,
            "y": 456
          }
        },
        {
          "id": "a4ff0e57-8710-43bd-84f6-c41eded90435",
          "type": "basic.output",
          "data": {
            "name": "ena_2clk",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 960,
            "y": 464
          }
        },
        {
          "id": "653def34-7abb-4924-8f15-8e326f02964e",
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
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -104,
            "y": 504
          }
        },
        {
          "id": "136cc2a3-009b-455d-aecb-b26cb259e486",
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
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -104,
            "y": 552
          }
        },
        {
          "id": "4e2de48f-16d4-4669-be41-bcdd717f6a58",
          "type": "basic.output",
          "data": {
            "name": "data_spi",
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
            "virtual": true
          },
          "position": {
            "x": 968,
            "y": 592
          }
        },
        {
          "id": "5191ecd2-99f0-4b5b-9a5f-d10e8f8f7509",
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
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -104,
            "y": 616
          }
        },
        {
          "id": "734d9762-f219-4091-8639-8f686819de29",
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
            "x": 280,
            "y": 208
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
            "block": "7be2ddb1-d6a1-4bd7-ae61-39bfb790c83a",
            "port": "out"
          },
          "target": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "rst"
          }
        },
        {
          "source": {
            "block": "27b9b159-fff3-4aa8-a549-d95bf7cffa35",
            "port": "out"
          },
          "target": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "busy_spi"
          }
        },
        {
          "source": {
            "block": "30efe8a5-78b5-4d54-9240-38fe50b23cf7",
            "port": "out"
          },
          "target": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "motor_pwm_left_i"
          },
          "size": 8
        },
        {
          "source": {
            "block": "d9089370-ca82-4916-a658-332acf5559d7",
            "port": "out"
          },
          "target": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "motor_pwm_rght_i"
          },
          "size": 8
        },
        {
          "source": {
            "block": "76d276fd-4d90-4f03-8e17-82b1cebc95b0",
            "port": "out"
          },
          "target": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "led_eye_left_rgb_i"
          },
          "size": 24
        },
        {
          "source": {
            "block": "653def34-7abb-4924-8f15-8e326f02964e",
            "port": "out"
          },
          "target": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "led_eye_rght_rgb_i"
          },
          "size": 24
        },
        {
          "source": {
            "block": "5191ecd2-99f0-4b5b-9a5f-d10e8f8f7509",
            "port": "out"
          },
          "target": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "led_blink_rght_rgb_i"
          },
          "size": 24
        },
        {
          "source": {
            "block": "136cc2a3-009b-455d-aecb-b26cb259e486",
            "port": "out"
          },
          "target": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "led_blink_left_rgb_i"
          },
          "size": 24
        },
        {
          "source": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "spi_ss_n"
          },
          "target": {
            "block": "69dc2722-2a9d-4126-b109-7e31cfea16b6",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "spi_send"
          },
          "target": {
            "block": "252056ef-9e93-4572-9542-6c05ab5014f3",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "ena_2clk"
          },
          "target": {
            "block": "a4ff0e57-8710-43bd-84f6-c41eded90435",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "data_spi"
          },
          "target": {
            "block": "4e2de48f-16d4-4669-be41-bcdd717f6a58",
            "port": "in"
          },
          "size": 8
        },
        {
          "source": {
            "block": "a1e8c8a0-be11-4a4d-a19e-f8ee03fa17ae",
            "port": "out"
          },
          "target": {
            "block": "734d9762-f219-4091-8639-8f686819de29",
            "port": "clk"
          }
        }
      ]
    }
  },
  "dependencies": {}
}