### 📜 **README.md – Mainframe Salary Report**
```markdown
# 🏢 Mainframe Salary Report

## 📌 Project Overview
The **Mainframe Salary Report** project is a COBOL-based application that processes employee salary data, applies classification-based salary increases, and generates a formatted payroll report. The program is executed on a **z/OS mainframe** using **COBOL** and **JCL**.

This project follows industry best practices for mainframe development, ensuring modularity, readability, and maintainability.

---

## 📂 Directory Structure
```
Mainframe-Salary-Report/
│── 📂 source_code/            # COBOL and JCL source files
│   ├── A4SALRPT.cbl          # COBOL program for salary processing
│   ├── A4CL.jcl              # JCL script for compilation & linkage
│   ├── A4R.jcl               # JCL script for execution
│── 📂 documentation/          # Project-related documents
│   ├── A4_Structure_Chart.docx
│── 📂 results/                # Program execution outputs
│── README.md                  # Project overview and setup guide
│── .gitignore                 # Files to be ignored by Git
```

---

## 🛠️ Technologies Used
- **COBOL** – Business-oriented programming language for mainframe applications.
- **JCL** – Job Control Language for compiling and running the program on z/OS.
- **z/OS Mainframe** – IBM's enterprise operating system.

---

## ⚙️ Features & Functionality
✅ **Processes Employee Salary Data** – Reads an input file containing employee records.  
✅ **Salary Classification** – Categorizes employees based on education and years of service.  
✅ **Automated Salary Increments** – Applies percentage increases based on employee classification.  
✅ **Formatted Payroll Report** – Outputs a structured report with page numbers, employee breakdowns, and summary statistics.  
✅ **Batch Job Execution** – Uses JCL to automate the processing.  

---

## 🏗️ Setup & Installation

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/devtalent2030/Mainframe-Salary-Report.git
cd Mainframe-Salary-Report
```

### **2️⃣ Run the Setup Script**
Execute the script to create all required folders and files:
```bash
./setup_project.sh
```

### **3️⃣ Add COBOL & JCL Code**
- Place the COBOL and JCL files in the **`source_code/`** directory.

### **4️⃣ Compile & Run on Mainframe**
#### **📌 Step 1: Compile the COBOL Program**
```bash
SUBMIT 'KC03YYY.DCMAFD01.A4.JCL(A4CL)'
```
#### **📌 Step 2: Execute the Job**
```bash
SUBMIT 'KC03YYY.DCMAFD01.A4.JCL(A4R)'
```
#### **📌 Step 3: Verify the Output**
The final payroll report will be generated in:
```bash
KC03YYY.DCMAFD01.A4.SALRPT.OUT
```

---
## 📝 Sample Input (Employee Data)
```

004   Archer Bill    N  01   7,260.05
185   Donneman Tom   G  06   4,230.09
317   Hanbee Aleta   G  03  50,000.03
318   Haney Carol    G  09  50,000.14
027   Alhouer Elaine G  01  25,730.02
100   Bates Tony     N  08  10,660.20
282   Estaban Juan   G  19  40,550.00
322   Harleton Jean  N  07   8,990.12
310   Gormally Marie G  03  30,220.06
921   Ull George     G  18  22,988.51
179   Damson Eric    G  03  25,020.18
739   Ridel Robert   N  05   1,940.08
308   Gleason James  G  01  50,000.03
909   Udson Doris    G  01  44,990.03
292   Everley Donna  G  03  20,000.17

```
## 📝 Expected Output (Sample)
```
EMPLOYEE SALARY REPORT              PAGE  1

EMP  EMP                            PRESENT  INCREASE     PAY           NEW
NUM  NAME          YEARS POSITION    SALARY     %       INCREASE       SALARY

030 ALLDREN RUTH     21  ANALYST   20,200.00  12.8%    $2,585.60+ $   22,785.60
004 ACHER WILLIAM     1             7,260.05               $0.00+ $    7,260.05
730 REEDE OWEN        9  SEN PROG   5,550.10   9.3%      $516.16+ $    6,066.26

...
```
For a complete sample report, see the **documentation** folder.

---

## 🎯 Project Goals
📌 Strengthen COBOL & JCL knowledge in mainframe development.  
📌 Implement structured programming & modular design.  
📌 Follow best practices for **batch job processing** and **file handling** in mainframes.  
📌 Produce well-documented and maintainable code.

---

## 👨‍💻 Author
**Talent Nyota**  
- **GitHub:** [devtalent2030](https://github.com/devtalent2030)  

---
