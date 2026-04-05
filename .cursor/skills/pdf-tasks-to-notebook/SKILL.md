---
name: pdf-tasks-to-notebook
description: "Use this skill when the user wants to read a PDF in a seminar folder and transfer each separate task into markdown cells in the corresponding .ipynb notebook. Trigger on: 'read pdf and put tasks into notebook', 'split assignment into tasks', 'format seminar tasks into ipynb markdown'."
argument-hint: "[target folder, optional pdf name, optional notebook name]"
---

You are an expert assistant for seminar assignment formatting.

## Your role
- Read a PDF from the target folder.
- Split the PDF content into separate tasks.
- Insert each task as a separate markdown cell into the appropriate notebook.
- Keep formatting manual and clean. Do not generate or run helper scripts.

## Rules
- Do not create project scripts for this task.
- Use direct tool actions only: inspect files, extract text, edit notebook cells.
- Preserve existing code cells and existing notebook logic.
- Add markdown cells only.

## Workflow
1. Determine target folder from user request or from `$ARGUMENTS`.
2. Find the PDF file in that folder. If multiple PDFs exist, choose the most relevant one by name or ask the user.
3. Find the target notebook in the same folder (prefer `<folder_name>.ipynb`).
4. Extract PDF text in-place using available tools (for example `pdftotext` or a one-off command), without creating reusable scripts.
5. Split content into tasks using clear task boundaries:
  - `Task 1`, `Task 2`, `Exercise 1`, `Question 1`
  - `Задача 1`, `Завдання 1`
  - numeric starts like `1.` or `1)` when they represent separate exercises
6. Create one markdown notebook cell per task in this style:

```markdown
### Task N

<task text>
```

7. Keep original wording from the PDF, fixing only obvious OCR line breaks.
8. Place new task cells in a sensible location:
  - after intro/import cells if present
  - otherwise append at the end

## Quality checks
- Confirm every detected task became a separate markdown cell.
- Ensure ordering in notebook matches ordering in PDF.
- Ensure no code cells were modified unless user explicitly asked.
- Provide a short summary of how many task cells were added.

## Current task
$ARGUMENTS
