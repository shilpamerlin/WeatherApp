# Weather App
An app shows weather conditions for specific city based on user search 

- **Swift**: 6
- **Architecture**: MVVM
- **Dependencies**: None
- **Unit Testing**: Wrote test cases to test API response and data retreval from UserDefault

## PreRequisties
**XCode**: 16.2

### WeatherHomeScreen

- Show empty state with appropriate message if no city name persists in Userdefault
-  **Cahe support - Stored last searched city name  to UserDefaults** in order show the weather details of that city on app launch

#### SearchResult screen

- Display SearchResult by making network call to WeatherAPI service based on user input and hit Enter
- Implemented Error handling

#### WeatherDetails screen

- Display WeatherDetails screen upon clicking the spefic search result  

## Screenshots
<img width="345" alt="Screenshot 2025-01-20 at 3 55 16 PM" src="https://github.com/user-attachments/assets/334c0494-fbfe-4f3f-8683-a548d6f52c0c" />
<img width="348" alt="Screenshot 2025-01-20 at 3 56 25 PM" src="https://github.com/user-attachments/assets/5185cb99-dcd0-4963-9b37-2e00418e758b" />
<img width="344" alt="Screenshot 2025-01-20 at 3 56 12 PM" src="https://github.com/user-attachments/assets/8666ea12-6a5a-4678-ae98-46933fc32f32" />

