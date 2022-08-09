import 'package:flutter/material.dart';

//Mixin are use in class code in multiple class hierarchy.Dart does not support multple inheritance.
//multiple inheritance means class extending two different classes
//we can not create instance of mixin

abstract class ElectronicDevice {
  void switchOn() {
    print("Switch on Tv ==>");
  }
}

abstract class FrequencyDevice extends ElectronicDevice {
  void channelTunning() {
    print("Channel tunning ==>");
  }
}

abstract class MechnicalDevice {
  void MechanicalInputs() {
    print("Mechanical inputs ==>");
  }
}

mixin audio on ElectronicDevice {
  void controlVolume() {
    print("controlVolume ==>");
  }
}

mixin display on ElectronicDevice { //only use with radio , television
  void changeResolution() {
    print("changeResolution ==>");
  }
}

mixin speed {
  void controlSpeed() {
    print("controlSpeed ==>");
  }
}

class Televison extends FrequencyDevice with audio, display {
  //Tv need this all four method also Radio need this methods (switch on , channeltunning, controlvoum , (reuse code switch on , channel tunning)

  void oprateAllthings() {
    switchOn();
    channelTunning();
    changeResolution();
    controlVolume();
  }
}

class Radio extends FrequencyDevice with audio {
  void oprateRadio() {
    switchOn();
    channelTunning();
    controlVolume();
  }
}

class Speaker extends ElectronicDevice with audio {
  void oprateSpeaker() {
    switchOn();
    controlVolume();
  }
}

class Motor extends ElectronicDevice with speed {
  void oprateMotors() {
    switchOn();
    controlSpeed();
  }
}

class MechanicalMotors extends MechnicalDevice with speed {
  void oprateSpeaker() {
    MechanicalInputs();
    controlSpeed();
  }
}

main() {
  Televison().oprateAllthings();
  Radio().oprateRadio();
  Speaker().oprateSpeaker();
  Motor().oprateMotors();
  MechanicalMotors().oprateSpeaker();
}
