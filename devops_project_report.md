# CS2005 Agile Software Development & DevOps - Project Documentation

## 1. Project Overview and Requirements

### Project Title and Abstract
**Project Title:** Civic Hub (iOS Application)
**Abstract:** Civic Hub is a real-time, user-friendly iOS mobile application built with Swift and SwiftUI to serve as a comprehensive directory for public and civic contacts in Bengaluru. It aims to empower citizens by providing quick, hierarchical access to government departmental contacts, escalation paths for grievances, and an AI-assistant interface for quick querying, thereby simplifying civic engagement.

### Requirement Analysis
**Functional Requirements:**
- **Department Browsing:** Users can browse through various government departments (e.g., BESCOM, BBMP).
- **Escalation Hierarchy:** Users can view clear, step-by-step escalation paths for lodging and tracking serious complaints.
- **AI Querying:** Users can ask an AI assistant natural language questions to find the correct civic contact or resource.
- **Quick Links:** One-tap access to WhatsApp numbers, email addresses, and official web portals for immediate action.

**Non-Functional Requirements:**
- **Usability:** The interface must be intuitive, modern (SwiftUI-based), and accessible to standard users without training.
- **Performance:** Navigation between tabs and loading of contact lists must be instantaneous.
- **Availability:** Core directory data should remain accessible even with intermittent network connectivity.
- **Maintainability:** Codebase organized using modular SwiftUI views to allow easy updates to contacts.

### Software Requirements Specification (SRS) Summary
The system is fundamentally a client-side iOS mobile application. 
- **User Interface:** Native iOS interfaces compliant with Apple's Human Interface Guidelines, utilizing `TabView`, `NavigationStack`, and card-based layouts.
- **Environment:** Designed for iOS 16.0+, written entirely in Swift.
- **Constraints:** Must operate smoothly within the mobile form factor, preserving screen space while delivering dense information clearly.

---

## 2. Agile Project Management Artifacts

### Scrum Team Roles
- **Product Owner:** Defines the vision for the Civic Hub, prioritizes the backlog ensuring the most critical civic contacts are added first, and accepts completed features.
- **Scrum Master:** Facilitates daily stand-ups, removes impediments (e.g., debugging build errors or API blockages), and ensures Agile practices are strictly followed.
- **Development Team:** Cross-functional team responsible for UI/UX design in SwiftUI, backend logic implementation, QA testing, and DevOps deployment.

### Product Backlog Example
*Structured prioritizing 3Cs (Card, Conversation, Confirmation) & INVEST criteria.*

1. **User Story:** As a citizen, I want to see an escalation path for unresolved complaints so I know who to contact next.
   - *Confirmation:* UI displays a numbered timeline (Steps 1 to 5) ending at the local authorities.
2. **User Story:** As an elderly resident, I want to view a simple list of phone numbers so I can quickly make a call without navigating complex menus.
   - *Confirmation:* Home screen features bold 'CardViews' with distinct WhatsApp and Phone icons.
3. **User Story:** As a user, I want to ask plain-text questions to an AI so I don't have to manually search the directory.
   - *Confirmation:* A dedicated 'AI Assistant' tab with a functioning text input field.

### Sprint Planning (High-Level)
- **Sprint 1:** UI Prototyping & Foundation. Setup Xcode project, create TabView structure, and base design system.
- **Sprint 2:** Data Integration & Home View. Build out the static lists of key contacts and implement the `CardView`.
- **Sprint 3:** Escalate & Explore Views. Construct the detailed hierarchical timeline components and departmental directories.
- **Sprint 4:** AI Assistant Mockup. Implement the chat UI layer and prepare it for backend API integration.
- **Sprint 5:** CI/CD & Testing. Setup GitHub actions, write unit tests, and integrate code quality checks.
- **Sprint 6:** Final Polish & Deployment Prep. User acceptance testing, bug squashing, and pre-release tagging.

### Definition of Done (DoD)
A backlog item is considered "Done" when:
- Code compiles locally without warnings or errors.
- UI elements match defined design standards.
- Peer code review is completed and approved.
- All associated unit tests pass.
- Changes are pushed to version control, merged to `main`, and CI pipeline succeeds.

---

## 3. System Modeling and Design

*(Conceptual Descriptions of Required UML)*

### Use Case Diagram
- **Actor:** Citizen User
- **Capabilities:** 
  - `Browse Departments`
  - `View Escalation Path`
  - `Query AI Assistant`
  - `Access Quick Links`

### Class Diagram
- **`ContentView`**: Manages the root `TabView`.
- **`HomeView`**, **`ExploreView`**, **`EscalateView`**, **`AIAssistantView`**: Distinct view structures inheriting from SwiftUI `View`.
- **Component Classes:** `CardView`, `ExploreCard`, `TimelineStep` (handle reusable UI states).

### Sequence Diagram (AI Query Flow)
1. **User** enters text in `AIAssistantView`.
2. **`AIAssistantView`** triggers intent action.
3. System processes natural language query.
4. System fetches contextual civil response.
5. System returns response rendering the answer on the UI.

---

## 4. Version Control and Code Quality

### Git Strategy
- **Repository Structure:** Centralized GitHub repository (`adithyaanandbtech24-sys/AGILE_PROJECT`).
- **Branching:** Utilizing a simplified Git Flow. Feature development happens on isolated branches (e.g., `feature/ai-integration`); production code resides in `main`.
- **Release Tagging:** Major milestones (e.g., v1.0 Release Candidate) are marked using `git tag -a v1.0 -m "Initial Beta Release"`.

### Static Code Analysis
As this is a Swift project, standards adhere strictly to SwiftLint guidelines (analogous to PyLint).
- **Checks applied:** Enforcing naming conventions, limiting line length, preventing force-unwrapping of optional variables, ensuring UI consistency.
- **Result:** The codebase is thoroughly linted to guarantee adherence to best practices before runtime execution.

---

## 5. Continuous Integration and Deployment (CI/CD)

### Pipeline Configuration
*Note: As an iOS application, CI automation frequently relies on GitHub Actions integrated with Xcode Build tools.*

**GitHub Actions Workflow (`.github/workflows/ios.yml`):**
- **Trigger:** On `push` or `pull_request` to `main`.
- **Jobs:**
  - `setup`: Provisions a macOS runner.
  - `build`: Runs `xcodebuild` to compile `AGILE PROJECT_FINAL.xcodeproj`.
  - `test`: Executes standard unit and UI tests.

### Containerization & Image Management
*While traditional Docker is less common for client-side iOS compilation, in a DevOps context for this course:*
- **Backend/API Services (if applicable for AI routing):** Packaged via `Dockerfile` utilizing standard lightweight Python or Node images.
- **Image Management:** Build artifacts and Docker images (for any supporting backend) are built within the CI pipeline, tagged appropriately, and pushed securely to a registry like Docker Hub for scalable deployment.

---

## 6. Testing and Quality Assurance

### Testing Types Applied
- **Unit Testing:** Ensuring individual SwiftUI views initialize without crashing and mock data mapping operates correctly.
- **UI Testing:** Verifying user flows, such as tapping an icon successfully switching tabs.

### Agile Testing Quadrants
| Quadrant | Focus | Examples in Project |
| :--- | :--- | :--- |
| **Q1 (Automated/Tech-facing)** | Code Quality | Swift XCTest Unit tests for logic and UI. |
| **Q2 (Automated/Biz-facing)** | Functional | Automated UI verification of escalation steps. |
| **Q3 (Manual/Biz-facing)** | Usability | User Acceptance Testing (UAT) on physical iPhone. |
| **Q4 (Tools/Tech-facing)** | Performance | Profiling memory usage via Xcode Instruments. |

### Test Documentation Summary
- **Test Plan:** An IEEE-829 compliant approach to test core UI paths to ensure sanity (e.g., is the app launching?), performance (e.g., speed of scroll on HomeView), and security (e.g., ensuring no hardcoded credentials).
- **Traceability Matrix:** Maps Requirements (e.g., "Must have AI query input") to specific test cases (e.g., `testAIInputFieldAcceptsText()`).

---

## 7. Conclusion and Reflection

### Sprint Retrospective Summary
Throughout the iterations, the team learned the vital importance of continuous integration in catching visual bugs early on different device sizes. SwiftUI's fast iteration speed improved team morale, though managing Xcode project file merge conflicts reinforced the need for frequent, small commits and clear communication between team members.

### DevOps Demo Results
The final end-to-end "code-to-deployment" flow demonstrates:
1. Writing UI feature code locally.
2. Committing safely via Git.
3. Automatically triggering testing pipelines (simulated/actual).
4. Verifying a clean, deployable artifact ready for an App Store or Ad-Hoc distribution environment.
