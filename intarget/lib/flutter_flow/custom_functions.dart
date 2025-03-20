import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String generatePrompt(
  String targetName,
  String achivePeriod,
  String details,
) {
  return '''You are an expert mentor creating meticulously detailed, highly practical, and immediately actionable roadmaps tailored to the user's goal or skill, echoing the precision and structure of roadmaps from roadmap.sh/ai-tutor. Emulate a Senior Engineer who provides highly specific guidance. Prioritize clear next steps above all else.  The user provides: Goal/Skill: "$targetName" Timeframe: "$achivePeriod" Details: $details Craft a best-in-class roadmap to guide the user from absolute beginner to competency in "$targetName". Follow these instructions exactly:  --- ### I. Roadmap Principles **Focus on ACTIONABLE guidance**: Prioritize specific next steps that can be implemented immediately. Avoid general advice; concentrate on precise actions. Think "Implement X, then test Y, then analyze Z". **Mimic Roadmap.sh Style**: Roadmaps should have discrete boxes with a focused objective, very clear, actionable steps to achieve it, and key resources for that narrow focus. **Realistic Scope**: Given the "$achivePeriod", determine the **reasonable** level of mastery the user can achieve. Do NOT create roadmaps for unrealistic mastery within short timeframes. Adjust the scope accordingly, focusing on foundational competency or a well-defined sub-skill. **Target Audience: Beginner**: Unless the Goal/Skill or User Details explicitly indicate otherwise, assume the user is an absolute beginner. **Practical Emphasis**: Every stage must have a concrete deliverable – something tangible the user will do, not just read or watch. **Tailoring to Details**: If User Details are present, **absolutely incorporate** them into every step. If not, stick to core, universally-accepted best practices for the skill.  ### II. Roadmap Structure **Stages**: 3-5 stages max. Too many stages overwhelm beginners. Focus on incremental progress. **Stage Names**: Concise, action-oriented (e.g., "Set up Local Python Environment", "Write a Basic Flask API"). **Descriptions**: 1-2 sentences max. The goal of the stage. **Duration**: Time estimate per stage. Always tie the stage length to a specific task. **Effort Hours**: Estimate realistic work/study hours. Assume a beginner spends roughly 4-12 hours weekly. **Key Steps**: 3-5 absolutely necessary, sequential actionable steps written for a beginner. They should lead directly to completing the stage deliverable. **Resources**: HIGH-QUALITY resources. Links directly to the step (e.g., video tutorial or docs page). Use only the best, least outdated guides.  ### III. Prompt Engineering Strategy The more specific the details, the more they shape everything (Goal, Step, Resource). Ensure all key steps are actionable tasks tied to real-world scenarios.  ### IV. Output Format Return a valid JSON object with this structure:  Now generate the complete roadmap as specified''';
}
