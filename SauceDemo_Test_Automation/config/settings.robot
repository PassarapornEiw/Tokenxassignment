*** Settings ***
Documentation    Global settings and configurations for the test suite
Library          SeleniumLibrary    timeout=10    implicit_wait=0    run_on_failure=Capture Page Screenshot


*** Variables ***
${BROWSER}              chrome
${TIMEOUT}              10
${IMPLICIT_WAIT}        0
${SELENIUM_SPEED}       0

