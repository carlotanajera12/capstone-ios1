# College Success Toolkit

## Table of Contents
1. Overview  
2. Product Spec  
3. Wireframes  
4. Schema  

---

## Overview

### Description
College Success Toolkit is an iOS application built using Swift and UIKit that helps college students stay organized, motivated, and informed about campus resources. The app provides task management, daily motivational quotes from an API, and a list of campus resources with detailed information and links.

---

### App Evaluation

**Category:** Education / Productivity  

**Mobile:**  
The app uses mobile-native features including tab navigation, local data persistence (UserDefaults), and API integration using URLSession. It is designed for quick and simple interactions on a mobile device.

**Story:**  
The app supports college students, especially first-year students, by helping them manage tasks, stay motivated, and access important campus resources.

**Market:**  
The target audience is college students, particularly those who need help staying organized and navigating campus support systems.

**Habit:**  
Users are encouraged to return daily for motivational quotes and to manage their tasks regularly.

**Scope:**  
The app includes multiple view controllers, API integration, data persistence, and navigation. The scope is appropriate for a capstone project and demonstrates required iOS development concepts.

---

## Product Spec

### 1. User Stories (Required and Optional)

#### Required Must-have Stories
- User can view a list of tasks  
- User can add a new task  
- User can edit or delete tasks  
- User can mark tasks as complete  
- User can view motivational quotes from an API  
- User can refresh quotes  
- User can save a favorite quote locally  
- User can view a list of campus resources  
- User can tap a resource to view details  
- User can open a resource link in Safari  

#### Optional Nice-to-have Stories
- User can categorize tasks  
- User can improve UI styling  
- User can add more detailed task information  
- User can add search functionality for resources  

---

### 2. Screen Archetypes

**Motivation Screen**  
- User can view a motivational quote  
- User can refresh the quote  
- User can save a favorite quote  

**Tasks List Screen**  
- User can view all tasks  
- User can add a task  
- User can delete a task  
- User can mark a task complete  

**Resources List Screen**  
- User can view a list of resources  
- User can select a resource  

**Resource Detail Screen**  
- User can view detailed information about a resource  
- User can open the resource link  

---

### 3. Navigation

#### Tab Navigation (Tab to Screen)
- Motivation Tab → Motivation Screen  
- Tasks Tab → Tasks List Screen  
- Resources Tab → Resources List Screen  

#### Flow Navigation (Screen to Screen)

**Motivation Screen**
- Refresh button → loads new API data  

**Tasks List Screen**
- Add button → alert input for new task  
- Tap task → edit task or toggle completion  

**Resources List Screen**
- Tap resource → Resource Detail Screen  

**Resource Detail Screen**
- Button → opens external link in Safari  

---

## Wireframes
(Add your hand-drawn wireframe images here)

---

## Schema

### Models

**Task**
- title: String  
- isCompleted: Bool  

**Quote**
- q: String  
- a: String  

**Resource**
- title: String  
- summary: String  
- url: String  
- type: ResourceType  

---

### Networking

**Motivation Screen**
- GET https://zenquotes.io/api/random  

Example response:

[
{
"q": "Quote text",
"a": "Author"
}
]
