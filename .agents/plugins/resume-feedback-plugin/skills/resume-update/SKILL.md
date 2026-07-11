---
name: resume-update
description: Developer resume update and interactive refinement orchestrator. Reads 'final_resume_feedback.md', matches target resume files in 'apps/portfolio/content', runs an interactive interview loop with the user to collect precise detail (metrics, architectures, soft skills), and updates the resume files. Trigger this skill when the user asks for '이력서 수정', '이력서 업데이트', '피드백 반영', 'resume update', or 'resume correction'.
---

# Developer Resume Update & Interactive Refinement Orchestrator

This skill orchestrates the `resume_updater` subagent to refine and update the developer's resume files located in `apps/portfolio/content` by applying recommendations from a feedback report (e.g., `final_resume_feedback.md`).

> [!IMPORTANT]
> The core mandate of this skill is **Zero-Assumption Editing**. The orchestrator and its subagent must NEVER make arbitrary additions. They must interview the user recursively until enough specific metrics, context, and details are collected to apply high-fidelity updates.

---

## Workflow Phases

### Phase 1: Pre-flight Verification & Content Scan

1. **Locate Feedback Report**: Search for the feedback report file. First check the project root `final_resume_feedback.md` or any path specified by the user. If not found, look for `.md` files containing feedback structure in the workspace. If no report is found, explain the situation to the user and ask for its location.
2. **Scan Original Resume Files**: Perform a recursive scan of `apps/portfolio/content/` to identify all target markdown/YAML files.
3. **Mandatory Resume Pre-scan**: Read and analyze the contents of all resume files _before_ generating any questions. If the details required to solve a feedback item (e.g., version numbers, explicit tools, dates, or quantitative numbers) are already present anywhere in the directory contents, reuse them immediately. Do NOT ask the user for information that is already written.
4. **Parse & Map Recommendations**: Map the feedback items to target files (e.g., career suggestions mapped to `careers/*.md`, project suggestions to `projects/*.md`).

### Phase 2: Orchestrated Interactive Interview Loop

1. **Initialize Subagent**: Spawn the `resume_updater` subagent using `invoke_subagent`. Pass it the mapped feedback items, original resume contents, and the 2026 recruitment guidelines.
2. **Strictly Sequential Interview Loop**:
   - Do NOT bundle questions. The subagent must output exactly **one single question** at a time.
   - The orchestrator will output this single question to the user and halt execution, waiting for the user's input.
   - Forward the user's reply to the subagent via `send_message`, which then processes the reply and yields either the next single question or a single draft.
3. **Strictly Sequential Draft Review**:
   - Present exactly **one draft edit at a time** (e.g., a single project description block or introduction rewrite) rather than consolidating all edits at once.
   - Once the user explicitly approves the single draft, write the change to the file immediately and proceed to the next update topic.

### Phase 3: Precise File Editing & Final Report

1. **Apply Updates**: Once the user approves the draft, let the `resume_updater` write the changes to the respective files in `apps/portfolio/content/` using exact replacement tools (`replace_file_content`).
2. **Verify Modification**: Scan modified files to verify that formatting, comments, and unrelated sections remain intact.
3. **Completion Summary**: Output a final summary report listing the modified files and a brief summary of what details were added or refined.

---

## Error Handling & Edge Cases

- **Missing Data**: If the user does not remember specific metrics (e.g., "I don't remember the latency improvement percentage"), the subagent must fall back to qualitative impact statements (e.g., "significantly reduced cache latency by introducing Redis") instead of inventing numbers.
- **User Interruption**: If the user wants to abort or skip a specific feedback item, record their decision, bypass the item, and proceed to the next topic.
- **Agent Failure**: If the subagent disconnects or errors out, the orchestrator should restore the session context and retry from the last saved state.

---

## Test Scenarios

### Standard Interview & Update Flow

1. User requests: "피드백 바탕으로 이력서 수정해줘".
2. Orchestrator loads `final_resume_feedback.md` and scans `apps/portfolio/content`.
3. Orchestrator invokes `resume_updater`.
4. `resume_updater` asks: "카카오 프로젝트에서 'A/B 테스트로 이탈률 15% 감소' 항목 외에, 당시 배포에 사용했던 CI/CD 툴은 구체적으로 무엇이었나요?"
5. User responds: "GitHub Actions와 Docker를 사용했습니다."
6. `resume_updater` drafts changes and presents them to the user.
7. User approves -> File updated.
