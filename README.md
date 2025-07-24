# gsm_pay_task

A simple Flutter app to demonstrate coding skills for the GSM Pay Flutter developer job offer.

* Developed a very simple app - Skipped some steps (like creating a toast util)
* Used MVC for architecture
* Used GetX for state management, DI, and utilities
* Used flat structure
* Each text field has its own validation and checks validation after submitting (on unfocus)
* Created a validation util for validating national code and other validations
* Wrote some unit tests for checking correct national code validation
* Used image picker to choose national card and birth certificate images from the gallery
* Used image cropper to crop picked images - 3x5 aspect ratio lock for national card
* Uploaded images as form data, submitted form as JSON
* Printed requests and responses - Skipped network connectivity check, error handling, parsing exceptions, making requests with Dio
* Used very_good_analysis for linter rules - Disabled some rules, ignored print warning (to demonstrate in production)
* Used money separator for monthly salary text field (grouping 3 by 3 e.g. 200,000)

App video: https://drive.google.com/file/d/1HR5mGAkiq_Fl8QFij_kYfjCcvvBa269J/view?usp=share_link
