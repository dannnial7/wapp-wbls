# 🌐 Web Applications Project Proposal

**Submission Deadline:** Week 7  
**Methodology:** WSDM (Web Site Design Method)

---

## 1. Website Title
> *[Insert your official Website Title here]*

## 2. Objectives
> *[Detail the primary and secondary objectives of your web application project. What are you trying to achieve?]*

## 3. Mission Statement
This section outlines the core direction of the web application based on the WSDM approach:

* **Target Audience:** *[Define exactly who the web application is built for (e.g., APU students, specific local businesses, etc.)]*
* **Purpose:** *[Explain the main goal or the specific problem this website solves]*
* **Subject:** *[Describe the core topic, domain, or content focus of the website]*

## 4. Audience Modelling

### 4.1 Audience Classification

* **Identify User Roles:** * **Role 1: Admin** - Manages the overall platform, content, and user accounts.
    * **Role 2: Learners** - Registered users who actively engage with and track educational materials.
    * **Role 3: Visitors/Guests** - Unregistered or temporary users exploring the platform.

> 💡 **Core System Requirement (CRUD):**
> All identified user roles above must be able to fully perform **CRUD** operations within their authorized scope. 
> * **C**reate (Add new data)
> * **R**ead (View existing data)
> * **U**pdate (Modify existing data)
> * **D**elete (Remove existing data)

* **Individual Use-Case Diagrams:**
    * ![Use Case - Admin](link-to-image) *(Replace with actual Admin use-case diagram)*
    * ![Use Case - Learners](link-to-image) *(Replace with actual Learners use-case diagram)*
    * ![Use Case - Visitors/Guests](link-to-image) *(Replace with actual Visitors/Guests use-case diagram)*
    
    *(Note: Ensure there is exactly one individual use-case diagram for each identified role).*

### 4.2 Audience Characterization

#### 👤 Role 1: Admin

**Table 1: Functional Requirements**
| Req ID | Requirement Description | Priority |
| :--- | :--- | :--- |
| FR-1.1 | **[Create]** Admin must be able to create new user accounts and course categories. | High |
| FR-1.2 | **[Read]** Admin must be able to view all system logs and learner progress reports. | High |
| FR-1.3 | **[Update]** Admin must be able to edit existing system configurations and content. | High |
| FR-1.4 | **[Delete]** Admin must be able to remove obsolete content or ban user accounts. | High |

**Table 2: Usability Requirements**
| Req ID | Requirement Description | Metric / Goal |
| :--- | :--- | :--- |
| UR-1.1 | The admin dashboard should load completely within 2 seconds. | Performance |
| UR-1.2 | Data tables must support quick sorting and filtering. | Efficiency |

**Table 3: Navigational Requirements**
| Req ID | Requirement Description | Target Path / View |
| :--- | :--- | :--- |
| NR-1.1 | Admin can access the user management interface from the sidebar. | `/admin/users` |
| NR-1.2 | Admin can navigate to system settings from the profile dropdown. | `/admin/settings` |

---

#### 👤 Role 2: Learners

**Table 1: Functional Requirements**
| Req ID | Requirement Description | Priority |
| :--- | :--- | :--- |
| FR-2.1 | **[Create]** Learners must be able to create personal notes and submit assignments. | High |
| FR-2.2 | **[Read]** Learners must be able to view enrolled modules, grades, and resources. | High |
| FR-2.3 | **[Update]** Learners must be able to update their user profile and edit draft submissions. | Medium |
| FR-2.4 | **[Delete]** Learners must be able to delete their uploaded files or personal comments. | Medium |

**Table 2: Usability Requirements**
| Req ID | Requirement Description | Metric / Goal |
| :--- | :--- | :--- |
| UR-2.1 | The learning interface must be fully responsive on mobile devices. | Accessibility |
| UR-2.2 | The system should provide clear error messages for failed submissions. | Error Prevention |

**Table 3: Navigational Requirements**
| Req ID | Requirement Description | Target Path / View |
| :--- | :--- | :--- |
| NR-2.1 | Learners can access active courses directly from the main dashboard. | `/learner/dashboard` |
| NR-2.2 | Learners can easily navigate back to previous modules using breadcrumbs. | Multi-level UI |

---

#### 👤 Role 3: Visitors/Guests

**Table 1: Functional Requirements**
| Req ID | Requirement Description | Priority |
| :--- | :--- | :--- |
| FR-3.1 | **[Create]** Guests must be able to create a temporary session or guest inquiry ticket. | Medium |
| FR-3.2 | **[Read]** Guests must be able to view public course catalogs, FAQs, and contact info. | High |
| FR-3.3 | **[Update]** Guests must be able to update their temporary inquiry details before submission. | Low |
| FR-3.4 | **[Delete]** Guests must be able to clear their guest session data or withdraw an inquiry. | Low |

**Table 2: Usability Requirements**
| Req ID | Requirement Description | Metric / Goal |
| :--- | :--- | :--- |
| UR-3.1 | The homepage must be visually engaging and clearly state the platform's purpose. | User Engagement |
| UR-3.2 | Registration links must be highly visible to encourage sign-ups. | Conversion |

**Table 3: Navigational Requirements**
| Req ID | Requirement Description | Target Path / View |
| :--- | :--- | :--- |
| NR-3.1 | Guests can navigate to the registration page from the top navigation bar. | `/register` |
| NR-3.2 | Guests can access the public catalog from the main landing page. | `/catalog` |

---

## 5. Project Scope
> *[Define the boundaries of your project. Clearly state what features and functionalities will be implemented for the Week 7 submission, and explicitly mention any features that are excluded from the current phase.]*

---


**Muhammad Danial Fitri bin Mohd Khairizal** *Student ID: TP077362* *Asia Pacific University (APU)*
Web_App_Proposal_README-v2.md
Displaying Web_App_Proposal_README-v2.md.
