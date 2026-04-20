# College Success Toolkit — Product Spec

## **App Overview**

### **App Description**
College Success Toolkit is an education-focused iOS app designed to support UNCC students—especially first-years and mentees—by providing daily motivation, simple task tracking, and quick access to essential campus resources. The goal is to help students stay organized, motivated, and aware of the support systems available to them.

### **App Evaluation (Mobile, Story, Market, Habit, Scope)**

**Mobile**  
- Uses mobile-native features such as tab navigation, local storage, and API calls.  
- Designed for quick, on-the-go access to motivation, tasks, and campus resources.

**Story**  
- Strong, relatable story: supports students academically and emotionally.  
- Clear value for mentees, first-year students, and peers navigating college life.

**Market**  
- Well-defined niche: UNCC students and similar college populations.  
- High relevance for academic support programs and mentoring initiatives.

**Habit**  
- Encourages daily use through motivational quotes and task tracking.  
- Resource tab provides ongoing value throughout the semester.

**Scope**  
- MVP is realistic and achievable within the course timeline.  
- Includes API integration, TableViews, Navigation, TabBar, and UserDefaults.  
- Stretch goals can be added without disrupting core functionality.

## **User Features**

### **Required (MVP) Features**
1. **Motivation Tab**
   - Fetch a motivational quote from a public API using URLSession + Codable.
   - Display quote + author.
   - Refresh button to load a new quote.

2. **Tasks Tab**
   - View a list of tasks in a TableView.
   - Add a new task (title + optional notes).
   - Save tasks using UserDefaults (custom struct).
   - Tap a task to view details.

3. **Resources Tab**
   - TableView of UNCC academic, wellness, and support resources.
   - Detail screen with description + external link.
   - Uses enums for resource categories.

4. **Navigation**
   - TabBarController with 3 tabs.
   - NavigationController for detail screens.

5. **Technical Requirements**
   - Uses enums, structs, classes, protocols, closures.
   - Uses UIKit + Storyboards + AutoLayout.
   - Uses typecasting + optionals appropriately.

---

### **Optional (Stretch) Features**
- Favorite quotes saved locally.
- Task categories (Academic, Personal, Urgent).
- Search bar for resources.
- Custom color themes inspired by UNCC branding.
- Simple habit tracker.


## **Screen Archetypes**

### **1. Motivation Screen**
- Displays quote + author.
- Refresh button.
- API error label (optional).

### **2. Tasks List Screen**
- TableView of tasks.
- “Add Task” button.
- Persistent storage via UserDefaults.

### **3. Add Task Screen**
- Text field for task title.
- Optional notes field.
- Save button.

### **4. Task Detail Screen**
- Shows full task info.
- Option to delete task.

### **5. Resources List Screen**
- TableView of UNCC resource categories.
- Each cell leads to a detail page.

### **6. Resource Detail Screen**
- Description of the resource.
- Button to open external link in Safari.


## **Navigation Flow**

### **Tab Navigation**
The app uses a TabBarController with three tabs:
1. **Motivation**
2. **Tasks**
3. **Resources**

---

### **Flow Navigation**

#### **Motivation Tab**
- Motivation Screen → (Refresh button reloads API)

#### **Tasks Tab**
- Tasks List Screen → Add Task Screen  
- Tasks List Screen → Task Detail Screen  
- Task Detail Screen → Back to Tasks List

#### **Resources Tab**
- Resources List Screen → Resource Detail Screen  
- Resource Detail Screen → External link (Safari)


---

# Activity 3: Wireframes

## Low-Fidelity Wireframes (Hand-Drawn)

Below are the hand-drawn wireframes for the core screens of the College Success Toolkit app.  
These sketches outline the layout, navigation flow, and main UI elements.


![Wireframe](wireframe.pdf)



