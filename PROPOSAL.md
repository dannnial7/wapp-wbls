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

**Identified User Roles**

| User Role | Description |
| :--- | :--- |
| **Admin** | Manages the overall platform, content, system configurations, and user accounts. |
| **Learners** | Registered users who actively engage with, track, and complete educational materials. |
| **Visitors/Guests** | Unregistered or temporary users exploring the platform and its public offerings. |

> 💡 **Core System Requirement (CRUD):**
> All identified user roles above must be able to fully perform **CRUD** operations within their authorized scope. 
> * **C**reate (Add new data)
> * **R**ead (View existing data)
> * **U**pdate (Modify existing data)
> * **D**elete (Remove existing data)

**Individual Use-Case Diagrams:**
* ![Use Case - Admin](link-to-image) *(Replace with actual Admin use-case diagram)*
* ![Use Case - Learners](link-to-image) *(Replace with actual Learners use-case diagram)*
* ![Use Case - Visitors/Guests](link-to-image) *(Replace with actual Visitors/Guests use-case diagram)*

### 4.2 Audience Characterization

#### 👤 Role 1: Admin

**Table 1: Informational Requirements**
| Req ID | Requirement Description | Data Source |
| :--- | :--- | :--- |
| IR-1.1 | The system must provide the admin with a summary of total active learners. | User Database |
| IR-1.2 | The system must display aggregated system logs and error reports. | System Logs |

**Table 2: Functional Requirements**
| Req ID | Requirement Description | Priority |
| :--- | :--- | :--- |
| FR-1.1 | **[Create]** Admin must be able to create new user accounts and course categories. | High |
| FR-1.2 | **[Read]** Admin must be able to view all system logs and learner progress reports. | High |
| FR-1.3 | **[Update]** Admin must be able to edit existing system configurations and content. | High |
| FR-1.4 | **[Delete]** Admin must be able to remove obsolete content or ban user accounts. | High |

**Table 3: Usability Requirements**
| Req ID | Requirement Description | Metric / Goal |
| :--- | :--- | :--- |
| UR-1.1 | The admin dashboard should load completely within 2 seconds. | Performance |
| UR-1.2 | Data tables must support quick sorting and filtering. | Efficiency |

---

#### 👤 Role 2: Learners

**Table 1: Informational Requirements**
| Req ID | Requirement Description | Data Source |
| :--- | :--- | :--- |
| IR-2.1 | The system must display the learner's current GPA and module progress. | Gradebook |
| IR-2.2 | The system must show upcoming assignment deadlines and announcements. | Course Schedule |

**Table 2: Functional Requirements**
| Req ID | Requirement Description | Priority |
| :--- | :--- | :--- |
| FR-2.1 | **[Create]** Learners must be able to create personal notes and submit assignments. | High |
| FR-2.2 | **[Read]** Learners must be able to view enrolled modules, grades, and resources. | High |
| FR-2.3 | **[Update]** Learners must be able to update their user profile and edit draft submissions. | Medium |
| FR-2.4 | **[Delete]** Learners must be able to delete their uploaded files or personal comments. | Medium |

**Table 3: Usability Requirements**
| Req ID | Requirement Description | Metric / Goal |
| :--- | :--- | :--- |
| UR-2.1 | The learning interface must be fully responsive on mobile devices. | Accessibility |
| UR-2.2 | The system should provide clear error messages for failed submissions. | Error Prevention |

---

#### 👤 Role 3: Visitors/Guests

**Table 1: Informational Requirements**
| Req ID | Requirement Description | Data Source |
| :--- | :--- | :--- |
| IR-3.1 | The system must provide general information about platform features and pricing. | CMS |
| IR-3.2 | The system must display contact information and frequently asked questions. | Static Content |

**Table 2: Functional Requirements**
| Req ID | Requirement Description | Priority |
| :--- | :--- | :--- |
| FR-3.1 | **[Create]** Guests must be able to create a temporary session or guest inquiry ticket. | Medium |
| FR-3.2 | **[Read]** Guests must be able to view public course catalogs, FAQs, and contact info. | High |
| FR-3.3 | **[Update]** Guests must be able to update their temporary inquiry details before submission. | Low |
| FR-3.4 | **[Delete]** Guests must be able to clear their guest session data or withdraw an inquiry. | Low |

**Table 3: Usability Requirements**
| Req ID | Requirement Description | Metric / Goal |
| :--- | :--- | :--- |
| UR-3.1 | The homepage must be visually engaging and clearly state the platform's purpose. | User Engagement |
| UR-3.2 | Registration links must be highly visible to encourage sign-ups. | Conversion |

---

## 5. Project Scope
> *[Define the boundaries of your project. Clearly state what features and functionalities will be implemented for the Week 7 submission.]*

### 5.1 Outside Scope (Optional)
> *[Explicitly mention any features, platforms, or integrations that are excluded from the current phase (e.g., mobile app native development, live third-party payment gateway integration, advanced AI chatbots, etc.).]*

---

## 6. Work Breakdown Structure (WBS)
The following WBS outlines the key phases, tasks, and deliverables for the Web Application project.

| WBS Code | Phase / Task | Deliverable / Output |
| :--- | :--- | :--- |
| **1.0** | **Project Initiation** | |
| 1.1 | Finalize Website Title & Objectives | Approved Scope Definition |
| 1.2 | Define Mission Statement | Target Audience, Purpose, Subject |
| **2.0** | **Requirement Analysis (WSDM)** | |
| 2.1 | Audience Classification | User Roles Table & Use Case Diagrams |
| 2.2 | Audience Characterization | Informational, Functional & Usability Tables |
| **3.0** | **Design Phase** | |
| 3.1 | Site Structure Design |
| 3.2 | Presentation Design (UI/UX) |
| 3.3 | Logical Data Design (ERD) |
| **4.0** | **Development Phase** | |
| 4.1 | Front-end Development | HTML/CSS/JS Implementation |
| 4.2 | Back-end & Database Setup | Server Logic & Database Schema |
| 4.3 | CRUD Implementation | Create, Read, Update, Delete for all roles |
| **5.0** | **Testing & Deployment** | |
| 5.1 | Usability & Functional Testing | Bug Reports and Fixes |
| 5.2 | Final Submission (Week 7) | Deployed App & Proposal Report |

---
