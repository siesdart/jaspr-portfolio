---
name: resume-feedback
description: Comprehensive developer resume feedback orchestrator. Scans the 'apps/portfolio/content' directory dynamically, reads resume Markdown/YAML files, aligns with 2026 developer recruitment trends, and generates a structured feedback report. Trigger this skill whenever the user asks for '이력서 피드백', 'resume feedback', '이력서 검토', '이력서 첨삭', '포트폴리오 피드백'.
---

# Developer Resume Feedback Orchestrator

This skill orchestrates a multi-agent team (`resume_analyzer` and `soft_skill_tuner`) to analyze and tune developer resumes located in `apps/portfolio/content`. It dynamically adapts to the directory structure and cross-references 2026 recruitment trends to deliver a high-impact, actionable feedback report.

---

## Workflow Phases

### Phase 1: Dynamic Content Discovery & Trend Loading

1. **Dynamic Scan**: Do NOT assume a fixed file schema. Perform a recursive scan of `apps/portfolio/content` to discover all files.
2. **Content Extraction**: Read the contents of all discovered files. Map them contextually based on their contents:
   - Identify introductory bios / about-me statements.
   - Identify skills list.
   - Identify career history (companies, roles, dates).
   - Identify projects (descriptions, tech stacks, outcomes).
   - Identify open-source or external links (GitHub, blogs).
3. **GitHub CLI Analysis**: If GitHub profile or repository links are found, run `gh` CLI commands to gather additional insights:
   - Use `gh repo view <owner>/<repo>` or `gh api /repos/<owner>/<repo>` to get project description, stars, primary language, and activity.
   - Use `gh api /users/<username>/events` or `gh pr list --author <username>` to collect recent developer activity.
   - Inject this collected GitHub intelligence into the analysis context.
4. **Load 2026 Trends**: Read the rules file `rules/recruitment_trends.md` to establish the evaluation baseline for 2026 IT developer hiring criteria (on-demand hiring focus, technical reasoning, quantifiable metrics, and tool-based collaboration).

### Phase 2: Multi-Agent Parallel Analysis

Invoke the subagents in parallel to perform specialized reviews:

1. **Invoke `resume_analyzer`**:
   - **Task**: Evaluate tech stack grouping, STAR structure of projects, technical decision logic (the "Why"), optimization metrics, developer links, and GitHub activity collected via `gh` CLI.
   - **Input**: Extracted resume content + collected GitHub insights + `rules/recruitment_trends.md` criteria.
   - **Expected Output**: Technical audit pointing out gaps, tech stack inconsistencies, and missing STAR elements with Before/After code snippets.

2. **Invoke `soft_skill_tuner`**:
   - **Task**: Evaluate how soft skills are expressed. Convert abstract clichés (e.g., "good communicator") into concrete tool-based collaborative actions (Figma, Storybook, Jira, Scrum sprint practices, rational decision-making).
   - **Input**: Extracted resume content + soft skill guidelines.
   - **Expected Output**: Tuned sentences and rewriting recommendations for about-me and experience descriptions showing 7 core traits through actions.

### Phase 3: Feedback Consolidation & Report Generation

1. **Collect Outputs**: Read the feedback results from both subagents (from returned values or files in `_workspace/`).
2. **Synthesize Report**: Draft a unified, polished feedback report in Korean, organized as follows:
   - **Executive Summary (핵심 역량)**: 3~5 lines summarizing career achievements, tech stack expertise, and business metrics.
   - **2026 Recruitment Trend Alignment**: How the current resume fits the 2026 hiring trends (on-demand focus, AI screening compatibility).
   - **Technical Audit & STAR Project Review**: Concrete feedback on projects, showing gaps in S/T/A/R and suggesting precise performance metrics (quantification) and technical decision reasoning.
   - **Soft Skills & Collaboration Tuning**: Before/After comparisons converting abstract soft skills into tool-based engineering actions.
   - **Missing Essentials Check**: Status of GitHub, Blog, and Open Source links.
3. **Output Artifact**: Write the final report to `_workspace/final_resume_feedback.md` and display it to the user.

---

## Error Handling

- If a subagent fails, do NOT crash the pipeline. Try a single retry. If it fails again, proceed using the orchestrator's own logic to fill the gaps, listing the limitation in the final report.
- If no resume files are found in `apps/portfolio/content`, prompt the user to specify the location of their resume or provide a sample template.

---

## Test Scenarios

### Standard Success Flow

1. User requests: `/resume-feedback` or "이력서 피드백해줘".
2. Orchestrator scans `apps/portfolio/content` -> Finds files.
3. Spawns `resume_analyzer` and `soft_skill_tuner` in parallel.
4. Aggregates results -> Outputs `final_resume_feedback.md`.

### Missing Files Flow

1. User requests: "이력서 첨삭해줘" but the target folder is empty.
2. Orchestrator alerts the user, explains the expected directory layout, and asks for a file path or direct input.
