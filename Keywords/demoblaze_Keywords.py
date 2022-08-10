*** Settings ***
Library		SeleniumLibrary
Variables	../Page_Objects/demoblaze_Page_Objects.py


***keyword ***
Open Browser
		[Documentation]		Create browser and opens specified link. Takes url as argument
		[Arguments]		${demoblaze_url}
		create webdriver		