- [InTarget: AI-Powered Productivity App](#intarget-ai-powered-productivity-app)
  - [1. Overview](#1-overview)
  - [2. Requirements](#2-requirements)
  - [3. App Flow](#3-app-flow)
    - [3.1. Dashboard: View Targets](#31-dashboard-view-targets)
    - [3.2. Access Target Details](#32-access-target-details)
    - [3.3. AI-Powered Features](#33-ai-powered-features)
    - [3.4. User Management](#34-user-management)
  - [4. Domain Model](#4-domain-model)
  - [5. Sequence Diagram](#5-sequence-diagram)
  - [6. Key Features](#6-key-features)
  - [7. Backend Architecture](#7-backend-architecture)
  - [8. Frontend Components](#8-frontend-components)
  - [9. Future Enhancements](#9-future-enhancements)
  - [10. Conclusion](#10-conclusion)

# InTarget: AI-Powered Productivity App

## 1. Overview
InTarget is a productivity app that empowers users to achieve their goals by leveraging generative AI to create a complete roadmap. The app is designed for individuals who may lack expertise or a clear vision for their goals. By providing key details, users can allow the AI to generate structured plans with phases and sub-phases to guide them toward success. Users can track progress, edit content, and regenerate plans when needed.

## 2. Requirements
1. **Authentication**: Email & Password.
2. **Add New Target**:
   - Target name
   - Details (prompt)
   - Target achieve days
   - Generative AI will generate the entire plan roadmap.
3. **View Targets**:
   - Target boxes
   - Review progress
4. **Access Target Details (Plan)**:
   - View phases:
     - Name
     - Materials (with URLs provided by AI)
     - Description
     - Status
   - View phase's sub-phases (steps)
   - Track progress
5. **Take Actions**:
   - Mark as completed
   - Edit content
   - Ask AI to regenerate plan

## 3. App Flow

### 3.1. Dashboard: View Targets
- Display target boxes showing:
  - Target name
  - Progress status
  - Due date
- Filter and sort options for better organization.

### 3.2. Access Target Details
- View the complete target plan, including:
  - Phases (with names, materials, descriptions, and status)
  - Sub-phases for each phase
  - Materials and resources provided as URLs by AI
- Mark phases or sub-phases as completed.
- Edit target content and details.
- Track progress visually (e.g., progress bar or percentage).
- Request AI to regenerate or optimize the plan.

### 3.3. AI-Powered Features
- Automatic generation of a complete goal roadmap.
- AI-based suggestions to improve the plan.
- Regenerate specific phases or the entire plan.

### 3.4. User Management
- User profile management.
- Settings for notifications and preferences.

## 4. Domain Model
![domain model svg](domain_model.svg)

## 5. Sequence Diagram

## 6. Key Features
- **Secure Authentication**: Email & password login.
- **AI Roadmap Generation**: Generates a complete plan based on the user's input.
- **Editable Content**: Modify phases and sub-phases.
- **Progress Tracking**: Visual progress tracking.
- **Flexible Target Management**: Add, edit, AI Regeneration, and complete targets.
- **Material Suggestions**: AI provides URLs for materials and resources.

## 7. Backend Architecture
- **Authentication API**: FireBase Authentication.
- **AI Model Integration**: For generating and plans using Gemini.
- **Database**: Firebase Database.

## 8. Frontend Components
- Dashboard (with target boxes)
- Add New Target Page
- Target Details Page

## 9. Future Enhancements
- Integration with calendar apps for reminders.
- Collaborative goal setting with team members.
- Points and rewards system for achieving milestones.
- Share targets with other users
- progress leader board

## 10. Conclusion
InTarget leverages AI to help users who lack direction or experience in planning their goals. It provides a complete and flexible roadmap, allowing users to track progress and make adjustments along the way to ensure success.