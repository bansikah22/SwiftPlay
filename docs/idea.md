# PortMedic

*A lightweight macOS utility for managing processes occupying network ports.*

## Overview

PortMedic is a native macOS desktop application built with **Swift** and **SwiftUI** that helps developers quickly identify and terminate processes occupying network ports.

Instead of repeatedly using terminal commands such as:

```bash
lsof -i :8080
kill -9 <PID>
```

PortMedic provides a clean graphical interface where developers can view active ports and release them with a single click.

The application is designed to be lightweight, fast, and focused on solving one common developer pain point.

---

# Problem Statement

During software development, it is common for applications to leave network ports occupied after crashing or not shutting down properly.

Developers currently need to:

1. Open the Terminal.
2. Find the process using a port.
3. Copy the Process ID (PID).
4. Execute another command to terminate the process.
5. Verify that the port has been released.

This repetitive workflow interrupts productivity and slows down development.

---

# Goal

Build a lightweight native macOS application that allows developers to:

- View all ports currently in use.
- Search for a specific port or process.
- View the Process ID (PID) and application name.
- Terminate the process with a single click.
- Refresh the list automatically or manually.
- Release occupied ports without opening the Terminal.

---

# Target Users

- Backend Developers
- Full Stack Developers
- DevOps Engineers
- Mobile Developers
- Students learning software development
- Anyone who regularly runs local development servers

---

# Tech Stack

- **Language:** Swift
- **Framework:** SwiftUI
- **Platform:** macOS
- **Architecture:** MVVM
- **System APIs:** Foundation (`Process`, `Pipe`)
- **Minimum macOS Version:** TBD

No backend.

No database.

No internet connection required.

---

# Core Features (MVP)

## 1. View Active Ports

Display all listening ports currently in use.

Example:

| Port | PID | Process |
|------|------|---------|
| 3000 | 9211 | node |
| 5432 | 1122 | postgres |
| 8080 | 4512 | java |

---

## 2. Search

Search by:

- Port number
- Process name

Examples:

```
8080
```

or

```
java
```

---

## 3. Kill Process

Terminate a selected process with one click.

Example:

```
[ Kill ]
```

---

## 4. Refresh

Refresh the port list manually.

```
[ Refresh ]
```

---

## 5. Confirmation Dialog

Prevent accidental termination.

Example:

```
Kill process "java" (PID 4512)?

Cancel      Kill
```

---

# Planned Features

## Auto Refresh

Automatically refresh the list every few seconds.

---

## Color Coding

Differentiate ports visually.

🟢 System Processes

🟡 User Applications

🔴 Unknown or Suspicious Processes

---

## Favorites

Pin frequently used development ports.

Examples:

- 3000
- 5173
- 5432
- 6379
- 8080
- 8081

---

## Kill by Process

Terminate all instances of a process.

Examples:

- Kill all Java
- Kill all Node
- Kill all Python

---

## Process Details

Display additional information:

- PID
- Process Name
- Command
- User
- Port
- Protocol

---

## Notifications

Show a native macOS notification after a process is terminated.

Example:

```
✓ Port 8080 released successfully
```

---

## History

Keep a log of recently terminated processes.

Example:

| Time | Port | Process |
|------|------|---------|
| 10:31 | 8080 | java |
| 10:45 | 3000 | node |

---

## Menu Bar Mode

Run as a lightweight menu bar application.

Possible menu:

```
PortMedic

8080  Java

3000  Node

5432  PostgreSQL

Refresh

Quit
```

This allows quick access without opening the main window.

---

## Copy Utilities

Quick actions:

- Copy PID
- Copy Port
- Copy Kill Command

---

## Open in Terminal

Open the selected process directly in Terminal for advanced inspection.

---

# Future Enhancements

- Display CPU and Memory usage for each process.
- Support both TCP and UDP ports.
- Export process list to CSV.
- Dark Mode optimization.
- Keyboard shortcuts.
- Detect ports commonly used by development frameworks.
- Auto-detect failed application launches caused by occupied ports.
- Monitor ports in real time.
- Display application icons where possible.

---

# Non-Goals (Version 1)

The first version will **not** include:

- Network monitoring
- Firewall management
- Remote machine support
- Docker container management
- Database integration
- Cloud synchronization
- User authentication

The focus is simplicity and speed.

---

# User Workflow

1. Launch PortMedic.
2. View all active ports.
3. Search for a port (optional).
4. Select the process.
5. Click **Kill**.
6. Confirm the action.
7. The application terminates the process.
8. The list refreshes automatically.
9. The port is now available.

---

# Example UI

```
--------------------------------------------------

                 PortMedic

--------------------------------------------------

🔍 Search

[___________________________]

--------------------------------------------------

PORT     PID      PROCESS          ACTION

3000     1921     node             Kill

5432     3112     postgres         Kill

8080     4512     java             Kill

9090     6521     spring           Kill

--------------------------------------------------

Refresh

--------------------------------------------------
```

---

# Why Build PortMedic?

PortMedic eliminates the need to remember terminal commands every time a development port becomes occupied.

It improves developer productivity by replacing repetitive command-line workflows with a simple, native, one-click interface.

Beyond being a practical daily utility, the project is an excellent way to learn macOS development with SwiftUI, process management, asynchronous programming, native system APIs, and modern application architecture.

---

# Project Vision

PortMedic aims to become a simple, fast, and reliable developer utility that stays out of the way while making one of the most common development tasks effortless: freeing occupied ports.

The philosophy is:

> **One click. One second. One free port.**
