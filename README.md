### OPES FINANCIAL APP

------------

- This project includes templates, pages, and programming code designed for the development of a financial app. 

- The backend logic is implemented using *Dart*, while the layouts are crafted with *Flutter*.

<br>
### DOWNLOAD

------------
1.- Install all necessary components. For Windows you can follow [Tutorial Windows](https://www.youtube.com/watch?v=VFDbZk2xhO4&t=328s "Tutorial Windows") and for Mac you can use [Tutorial Mac](https://www.youtube.com/watch?v=f09c-nw15K8 "Tutorial Mac")

2.- Download the project. You can do it as a .zip file or using the command 
`git clone https://github.com/Joansanbib/opes-financialapp` on your system folder.

3.- Open the project on your IDE. 
> I recommend if  you're using Visual Studio Code to use the `code .` on your project root folder terminal to open the project in a fast way.

4.- Select the emulator. 
Before running the App, you must select which device you're gonna use. 
> On VSCode you can use the shortcut` Ctrl + Shift + P` for Windows or `Cmd + Shift + P` on Mac to open settings window and search for 'Select Device'

5.- Run the App.
> On VSCode you can go to 'Run' tab (top of the IDE) and select 'Run Without Debugging'

#### IMPORTANT
Once you've run the app you'll see that the default page is the Dashboard. There's also more pages you can access but not via the main one. Here's the list of all pages:
-   Dashboard (template)
-   Balance (template)
-   Countries (JSON plain text to check API's working)
-   Customers (JSON plain text to check API's working)
-   PartnerConsents (JSON plain text to check API's working)
-   Providers (JSON plain text to check API's working)
-   Transactions (template)

![flutter_tutorial](https://github.com/user-attachments/assets/c2e06e44-3d76-4a88-927d-55805d857e71)

> To navigate between pages, change the page on the *main.dart* file as you can see on the image

### STRUCTURE

------------

Due the app uses an API RESTful I believe It's fundamental to follow the correct standars as much as It possible, to keep a clean code and to organizise everything in layers.
I've used MVVM (Model-View-ViewModel), a programming paradigm that divides responsybilities on depending level of extraction.
So, I've divided the project on four stages (folders) : 

			Data (It interacts directly with the API data)
			Domain (It's used to interpret the data received)
			ViewModel (Connection between interfaces and API backend)
			UI (User Interfaces or layouts)

As you can see here, layers descend as user interaction approaches.

![mvvm](https://github.com/user-attachments/assets/78f905eb-8d30-421f-895f-1b437e6628cc)

