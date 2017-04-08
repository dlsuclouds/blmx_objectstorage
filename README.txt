De La Salle University Manila
College of Computer Studies
Cloud Technologies
January - April 2017

							Final Project (Hackathon)

I. Overview

	This repository is used for the sole purpose of education. It is not intended for business use.

	This final project is a requirement for LBYCLDS course taken up on the 2nd Term of AY 2016-2017.


II. Technologies Used
	
	This application is powered by IBM Bluemix.
	It uses the Watson service called "Text to Speech" to handle the conversion of the text
	It uses the service of "Object Storage" to handle the file upload.

III. Deployment in Bluemix

	This application is deployed in Bluemix via delivery pipeline.
	*Note: A pipeline is not required but it is recommended.

	To deploy this application:
		1) Fork the github repository https://github.com/dlsuclouds/blmx_objectstorage
		2) Login to Bluemix DevOps https://hub.jazz.net/
		3) Click "Create Project"
		4) Name the project and click "Link to an existing Github repository"
		5) Select the forked repository
		6) Keep the default configurations and click "Create"
		7) Click "Edit Code" then click on the git icon found on the left
		8) Enter a commit message then commit and push
		9) Click "Build and Deploy"
		10) Create the Build stage, Test stage, and the Deploy stage
			*Note: The cf push command is "cf push <unique>-<name> -m 256M -p build/libs/ObjectStorage.war"
		11) Run the Build stage and the rest should follow
		12) Go to https://console.ng.bluemix.net/
		13) Click "Create Service"
		14) Look for the Object Storage service and bind it to the application
		15) Restage the app
		16) Repeat steps 13-15 to bind the Watson Text to Speech service
		17) After restaging, the app can be run

	To use the application:
		*Note: The services are independent of each other, meaning there is no definite order to be followed.

		Text to Speech:
		1) Enter the desired text and click "Convert"
		2) A file is automatically downloaded containing audio

		Object Storage:
		1) Browse for the file to be uploaded
		2) Click "Submit"
		3) The file is uploaded

IV. References and Sources
	
	The code was forked from Mr. Jung Torralba's github repository.
	Text to Speech - https://github.com/artorralbaiii/blmx_texttospeech
	Object Storage - https://github.com/artorralbaiii/blmx_objectstorage

	The CSS Bootstrap "Sumo Landing" was downloaded from online - 
	https://colorlib.com/wp/one-page-website-templates/

	Several images were added in the repository however all initally uploaded files belong to their respective owners.

V. Proponents

	This project was created by the following:

	Arceo, Rodolfo III
	Izumiya, Carlo
	Leong, Herbert
	Yusay, Gabriel

	All rights reserved. 2017.
	

