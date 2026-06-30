// ============================================================
// IPTp-SP Digital Support System — SMS Payload Examples
// Every message payload from "Malaria IPTp Final Flows" (resources/),
// modeled as IPTpSMSCommunication instances, in English and Kiswahili.
// Channel 1 = dedicated short code 25332 (interactive).
// Channel 2 = InfoAFYA sender ID (one-way behavioural support).
// ============================================================

// ------------------------------------------------------------
// 1. ONBOARDING (sent on short code 25332 immediately after USSD enrollment)
// ------------------------------------------------------------

Instance: IPTpSMSOnboarding1EnExample
InstanceOf: IPTpSMSCommunication
Title: "Onboarding Message 1 (EN) - Enrollment Confirmation"
Description: "Onboarding message 1, sent on short code 25332 immediately after USSD enrollment confirmation"
Usage: #example
* id = "iptp-sms-onboarding-1-en"
* status = #completed
* category = $iptp-cs#msg-onboarding-enrollment "Onboarding: Enrollment Confirmation"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-03-16T10:05:00+03:00"
* payload[0].contentString = "You were enrolled today at ANC for malaria prevention reminders during pregnancy. This is the Ministry of Health malaria program. Keep this message."
* language = #en

Instance: IPTpSMSOnboarding1SwExample
InstanceOf: IPTpSMSCommunication
Title: "Onboarding Message 1 (SW) - Enrollment Confirmation"
Description: "Onboarding message 1, Kiswahili translation"
Usage: #example
* id = "iptp-sms-onboarding-1-sw"
* status = #completed
* category = $iptp-cs#msg-onboarding-enrollment "Onboarding: Enrollment Confirmation"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-03-16T10:05:00+03:00"
* payload[0].contentString = "Umesajiliwa leo katika kliniki ya wajawazito (ANC) kupokea jumbe za ukumbusho kuhusu kinga ya malaria wakati wa ujauzito. Hii ni huduma kutoka Wizara ya Afya. Hifadhi ujumbe huu."
* language = #sw

Instance: IPTpSMSOnboarding2EnExample
InstanceOf: IPTpSMSCommunication
Title: "Onboarding Message 2 (EN) - How It Works"
Description: "Onboarding message 2, sent on short code 25332"
Usage: #example
* id = "iptp-sms-onboarding-2-en"
* status = #completed
* category = $iptp-cs#msg-onboarding-how-it-works "Onboarding: How It Works"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-03-16T10:06:00+03:00"
* payload[0].contentString = "We will send reminders to support you. Follow the malaria dose date as explained at the clinic. We will send reminders to support you."
* language = #en

Instance: IPTpSMSOnboarding2SwExample
InstanceOf: IPTpSMSCommunication
Title: "Onboarding Message 2 (SW) - How It Works"
Description: "Onboarding message 2, Kiswahili translation"
Usage: #example
* id = "iptp-sms-onboarding-2-sw"
* status = #completed
* category = $iptp-cs#msg-onboarding-how-it-works "Onboarding: How It Works"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-03-16T10:06:00+03:00"
* payload[0].contentString = "Fuata tarehe ya dozi ya malaria ulivyoelezwa kliniki. Tutakutumia jumbe za kukukumbusha."
* language = #sw

Instance: IPTpSMSOnboarding3EnExample
InstanceOf: IPTpSMSCommunication
Title: "Onboarding Message 3 (EN) - How to Take SP"
Description: "Onboarding message 3, sent on short code 25332"
Usage: #example
* id = "iptp-sms-onboarding-3-en"
* status = #completed
* category = $iptp-cs#msg-onboarding-how-to-take "Onboarding: How to Take SP"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-03-16T10:07:00+03:00"
* payload[0].contentString = "Store malaria tablets in a cool, dry place. On your dose date, take all 3 SP tablets together. Swallow whole. With or without food."
* language = #en

Instance: IPTpSMSOnboarding3SwExample
InstanceOf: IPTpSMSCommunication
Title: "Onboarding Message 3 (SW) - How to Take SP"
Description: "Onboarding message 3, Kiswahili translation"
Usage: #example
* id = "iptp-sms-onboarding-3-sw"
* status = #completed
* category = $iptp-cs#msg-onboarding-how-to-take "Onboarding: How to Take SP"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-03-16T10:07:00+03:00"
* payload[0].contentString = "Weka tembe za malaria mahali pakavu, mbali na joto ama jua. Siku ya kumeza dozi yako, meza tembe zote tatu za SP kwa pamoja. Meza tembe nzima. Unaweza kumeza ukiwa umekula au bila chakula."
* language = #sw

Instance: IPTpSMSOnboarding4EnExample
InstanceOf: IPTpSMSCommunication
Title: "Onboarding Message 4 (EN) - Safety + InfoAFYA Bridge"
Description: "Onboarding message 4, sent on short code 25332"
Usage: #example
* id = "iptp-sms-onboarding-4-en"
* status = #completed
* category = $iptp-cs#msg-onboarding-safety-bridge "Onboarding: Safety + InfoAFYA Bridge"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-03-16T10:08:00+03:00"
* payload[0].contentString = "If you develop severe rash, swelling, or difficulty breathing after taking your dose, go to a health facility immediately. You will also receive supportive InfoAFYA messages."
* language = #en

Instance: IPTpSMSOnboarding4SwExample
InstanceOf: IPTpSMSCommunication
Title: "Onboarding Message 4 (SW) - Safety + InfoAFYA Bridge"
Description: "Onboarding message 4, Kiswahili translation"
Usage: #example
* id = "iptp-sms-onboarding-4-sw"
* status = #completed
* category = $iptp-cs#msg-onboarding-safety-bridge "Onboarding: Safety + InfoAFYA Bridge"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-03-16T10:08:00+03:00"
* payload[0].contentString = "Ukipata dalili kama upele mkali, kuvimba au shida ya kupumua baada ya kumeza dawa, nenda kituo cha afya mara moja. Pia utapokea jumbe saidizi za InfoAFYA."
* language = #sw

// ------------------------------------------------------------
// 2. DOSE REMINDER CYCLE (short code 25332)
// ------------------------------------------------------------

Instance: IPTpSMSReminderT3EnExample
InstanceOf: IPTpSMSCommunication
Title: "T-3 Reminder (EN)"
Description: "Non-interactive T-3 reminder sent at 4:00pm, 3 days before the Dose 2 date"
Usage: #example
* id = "iptp-sms-reminder-t3-en"
* status = #completed
* category = $iptp-cs#reminder-t3 "T-3 Reminder"
* extension[reminderAnchor].valueCodeableConcept = $iptp-cs#reminder-t3 "T-3 Reminder"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-10T16:00:00+03:00"
* payload[0].contentString = "Reminder: Your malaria prevention dose is due on 13 Apr 2026. Keep your tablets ready."
* language = #en

Instance: IPTpSMSReminderT3SwExample
InstanceOf: IPTpSMSCommunication
Title: "T-3 Reminder (SW)"
Description: "Non-interactive T-3 reminder, Kiswahili translation"
Usage: #example
* id = "iptp-sms-reminder-t3-sw"
* status = #completed
* category = $iptp-cs#reminder-t3 "T-3 Reminder"
* extension[reminderAnchor].valueCodeableConcept = $iptp-cs#reminder-t3 "T-3 Reminder"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-10T16:00:00+03:00"
* payload[0].contentString = "Ukumbusho: Dozi yako ya kinga ya malaria ni 13 Aprili 2026. Weka tembe zako tayari."
* language = #sw

Instance: IPTpSMSReminderT0SwExample
InstanceOf: IPTpSMSCommunication
Title: "T-0 Reminder (SW)"
Description: "Interactive dose-day reminder sent at 08:00am, Kiswahili translation (English version is IPTpT0ReminderExample)"
Usage: #example
* id = "iptp-sms-reminder-t0-sw"
* status = #completed
* category = $iptp-cs#reminder-t0 "T-0 Reminder"
* extension[reminderAnchor].valueCodeableConcept = $iptp-cs#reminder-t0 "T-0 Reminder"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T08:00:00+03:00"
* payload[0].contentString = "Leo ni siku ya dozi yako ya kinga ya malaria. Meza tembe zote tatu kwa pamoja. Ukimeza, jibu: 1 Nilimeza 2 Bado sijameza 3 Nina tatizo STOP kusitisha jumbe"
* language = #sw

// ------------------------------------------------------------
// 3. CONFIRMATION ENGINE (short code 25332)
// ------------------------------------------------------------

Instance: IPTpSMSConfirmAckTakenEnExample
InstanceOf: IPTpSMSCommunication
Title: "Confirmation Ack: Took It (EN)"
Description: "Sent after the patient replies 1 (took it) to the T-0 reminder"
Usage: #example
* id = "iptp-sms-confirm-ack-taken-en"
* status = #completed
* category = $iptp-cs#msg-confirmation-ack-taken "Confirmation Ack: Took It"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T09:16:00+03:00"
* payload[0].contentString = "Thank you. Your dose has been recorded. We will remind you before your next dose."
* language = #en

Instance: IPTpSMSConfirmAckTakenSwExample
InstanceOf: IPTpSMSCommunication
Title: "Confirmation Ack: Took It (SW)"
Description: "Confirmation acknowledgement, Kiswahili translation"
Usage: #example
* id = "iptp-sms-confirm-ack-taken-sw"
* status = #completed
* category = $iptp-cs#msg-confirmation-ack-taken "Confirmation Ack: Took It"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T09:16:00+03:00"
* payload[0].contentString = "Asante. Dozi yako imerekodiwa. Tutakukumbusha kabla ya dozi inayofuata."
* language = #sw

Instance: IPTpSMSConfirmAckPendingEnExample
InstanceOf: IPTpSMSCommunication
Title: "Confirmation Ack: Not Yet (EN)"
Description: "Sent after the patient replies 2 (not yet) to the T-0 reminder"
Usage: #example
* id = "iptp-sms-confirm-ack-pending-en"
* status = #completed
* category = $iptp-cs#msg-confirmation-ack-pending "Confirmation Ack: Not Yet"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T08:30:00+03:00"
* payload[0].contentString = "Thanks for letting us know. Please remember to take your malaria prevention tablets today. Reply 1 once you have taken them."
* language = #en

Instance: IPTpSMSConfirmAckPendingSwExample
InstanceOf: IPTpSMSCommunication
Title: "Confirmation Ack: Not Yet (SW)"
Description: "Confirmation acknowledgement, Kiswahili translation"
Usage: #example
* id = "iptp-sms-confirm-ack-pending-sw"
* status = #completed
* category = $iptp-cs#msg-confirmation-ack-pending "Confirmation Ack: Not Yet"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T08:30:00+03:00"
* payload[0].contentString = "Asante kwa kutujulisha. Tafadhali kumbuka kumeza tembe zako za kinga ya malaria leo. Jibu 1 ukishameza."
* language = #sw

Instance: IPTpSMSNudge24hEnExample
InstanceOf: IPTpSMSCommunication
Title: "24h Nudge (EN)"
Description: "Sent if no reply/confirmation is received 24 hours after the T-0 reminder"
Usage: #example
* id = "iptp-sms-nudge-24h-en"
* status = #completed
* category = $iptp-cs#reminder-24h "24h Nudge"
* extension[reminderAnchor].valueCodeableConcept = $iptp-cs#reminder-24h "24h Nudge"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-14T08:00:00+03:00"
* payload[0].contentString = "We have not received confirmation of your dose. Reply 1 below if taken or 3 if you need help."
* language = #en

Instance: IPTpSMSNudge24hSwExample
InstanceOf: IPTpSMSCommunication
Title: "24h Nudge (SW)"
Description: "24-hour nudge, Kiswahili translation"
Usage: #example
* id = "iptp-sms-nudge-24h-sw"
* status = #completed
* category = $iptp-cs#reminder-24h "24h Nudge"
* extension[reminderAnchor].valueCodeableConcept = $iptp-cs#reminder-24h "24h Nudge"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-14T08:00:00+03:00"
* payload[0].contentString = "Hatujapokea uthibitisho kwamba ulimeza tembe zako. Jibu 1 kama ulimeza au 3 kama unahitaji msaada."
* language = #sw

Instance: IPTpSMSNudge72hEnExample
InstanceOf: IPTpSMSCommunication
Title: "72h Nudge (EN)"
Description: "Sent if no reply/confirmation is received 72 hours after the T-0 reminder; triggers CHP follow-up"
Usage: #example
* id = "iptp-sms-nudge-72h-en"
* status = #completed
* category = $iptp-cs#reminder-72h "72h Escalation"
* extension[reminderAnchor].valueCodeableConcept = $iptp-cs#reminder-72h "72h Escalation"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-16T08:00:00+03:00"
* payload[0].contentString = "We have not received confirmation of your dose. Reply 1 below if taken or 3 if you need help."
* language = #en

Instance: IPTpSMSNudge72hSwExample
InstanceOf: IPTpSMSCommunication
Title: "72h Nudge (SW)"
Description: "72-hour nudge, Kiswahili translation; triggers CHP follow-up (see IPTpCHPFollowUpTaskExample)"
Usage: #example
* id = "iptp-sms-nudge-72h-sw"
* status = #completed
* category = $iptp-cs#reminder-72h "72h Escalation"
* extension[reminderAnchor].valueCodeableConcept = $iptp-cs#reminder-72h "72h Escalation"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-16T08:00:00+03:00"
* payload[0].contentString = "Hatujapokea uthibitisho kwamba ulimeza tembe zako. Jibu 1 kama ulimeza au 3 kama unahitaji msaada."
* language = #sw

// ------------------------------------------------------------
// 4. HAVE AN ISSUE FLOW (triggered by Reply 3, short code 25332)
// ------------------------------------------------------------

Instance: IPTpSMSIssueProblemTypeEnExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow Step 1: Problem Type (EN)"
Description: "Sent after the patient replies 3 (have an issue)"
Usage: #example
* id = "iptp-sms-issue-problem-type-en"
* status = #completed
* category = $iptp-cs#msg-issue-problem-type "Issue Flow: Problem Type Prompt"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T10:01:00+03:00"
* payload[0].contentString = "What problem have you experienced? 1 Side effect 2 Lost medicine 3 Other"
* language = #en

Instance: IPTpSMSIssueProblemTypeSwExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow Step 1: Problem Type (SW)"
Description: "Issue flow problem-type prompt, Kiswahili translation"
Usage: #example
* id = "iptp-sms-issue-problem-type-sw"
* status = #completed
* category = $iptp-cs#msg-issue-problem-type "Issue Flow: Problem Type Prompt"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T10:01:00+03:00"
* payload[0].contentString = "Umepata shida gani? 1 Madhara ya dawa 2 Nimepoteza dawa 3 Shida nyingine"
* language = #sw

Instance: IPTpSMSIssueSeverityPromptEnExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Side Effect Severity Prompt (EN)"
Description: "Sent after the patient selects 1 (side effect)"
Usage: #example
* id = "iptp-sms-issue-severity-prompt-en"
* status = #completed
* category = $iptp-cs#msg-issue-side-effect-severity "Issue Flow: Side Effect Severity Prompt"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T10:02:00+03:00"
* payload[0].contentString = "How serious are the symptoms? 1 Mild 2 Severe"
* language = #en

Instance: IPTpSMSIssueSeverityPromptSwExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Side Effect Severity Prompt (SW)"
Description: "Side-effect severity prompt, Kiswahili translation"
Usage: #example
* id = "iptp-sms-issue-severity-prompt-sw"
* status = #completed
* category = $iptp-cs#msg-issue-side-effect-severity "Issue Flow: Side Effect Severity Prompt"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T10:02:00+03:00"
* payload[0].contentString = "Hatari kiasi gani? 1 Kiasi 2 Hatari sana"
* language = #sw

Instance: IPTpSMSIssueMildResponseEnExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Mild Side Effect Response (EN)"
Description: "Sent after the patient selects 1 (mild)"
Usage: #example
* id = "iptp-sms-issue-mild-response-en"
* status = #completed
* category = $iptp-cs#msg-issue-mild-response "Issue Flow: Mild Side Effect Response"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T10:03:00+03:00"
* payload[0].contentString = "Thank you. Mild symptoms can pass quickly. If you feel worse, inform your CHP or visit a health facility."
* language = #en

Instance: IPTpSMSIssueMildResponseSwExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Mild Side Effect Response (SW)"
Description: "Mild side-effect response, Kiswahili translation"
Usage: #example
* id = "iptp-sms-issue-mild-response-sw"
* status = #completed
* category = $iptp-cs#msg-issue-mild-response "Issue Flow: Mild Side Effect Response"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T10:03:00+03:00"
* payload[0].contentString = "Naelewa. Madhara madogo mara nyingi huisha haraka. Hali ikizidi, mjulishe mhudumu wa afya wa jamii (CHP) au nenda kituo cha afya."
* language = #sw

Instance: IPTpSMSIssueSevereResponseEnExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Severe Side Effect Response (EN)"
Description: "Sent after the patient selects 2 (severe)"
Usage: #example
* id = "iptp-sms-issue-severe-response-en"
* status = #completed
* category = $iptp-cs#msg-issue-severe-response "Issue Flow: Severe Side Effect Response"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-20T11:31:00+03:00"
* payload[0].contentString = "Go to the nearest health facility immediately."
* language = #en

Instance: IPTpSMSIssueSevereResponseSwExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Severe Side Effect Response (SW)"
Description: "Severe side-effect response, Kiswahili translation"
Usage: #example
* id = "iptp-sms-issue-severe-response-sw"
* status = #completed
* category = $iptp-cs#msg-issue-severe-response "Issue Flow: Severe Side Effect Response"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-20T11:31:00+03:00"
* payload[0].contentString = "Tafadhali nenda kituo cha afya kilicho karibu nawe mara moja."
* language = #sw

Instance: IPTpSMSIssueLostMedicineResponseEnExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Lost Medicine Response (EN)"
Description: "Sent after the patient selects 2 (lost medicine)"
Usage: #example
* id = "iptp-sms-issue-lost-medicine-response-en"
* status = #completed
* category = $iptp-cs#msg-issue-lost-medicine-response "Issue Flow: Lost Medicine Response"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T10:06:00+03:00"
* payload[0].contentString = "Please inform your CHP or visit your health facility for advice and replacement."
* language = #en

Instance: IPTpSMSIssueLostMedicineResponseSwExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Lost Medicine Response (SW)"
Description: "Lost medicine response, Kiswahili translation"
Usage: #example
* id = "iptp-sms-issue-lost-medicine-response-sw"
* status = #completed
* category = $iptp-cs#msg-issue-lost-medicine-response "Issue Flow: Lost Medicine Response"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-13T10:06:00+03:00"
* payload[0].contentString = "Mjulishe mhudumu wa afya wa jamii (CHP) au nenda kituo cha afya kwa ushauri na dawa nyingine."
* language = #sw

Instance: IPTpSMSIssueOtherPromptEnExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Other - Free Text Prompt (EN)"
Description: "Sent after the patient selects 3 (other); system enters AWAITING_FREE_TEXT"
Usage: #example
* id = "iptp-sms-issue-other-prompt-en"
* status = #completed
* category = $iptp-cs#msg-issue-other-prompt "Issue Flow: Other - Free Text Prompt"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-20T12:00:00+03:00"
* payload[0].contentString = "Please type your concern."
* language = #en

Instance: IPTpSMSIssueOtherPromptSwExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Other - Free Text Prompt (SW)"
Description: "Free-text concern prompt, Kiswahili translation"
Usage: #example
* id = "iptp-sms-issue-other-prompt-sw"
* status = #completed
* category = $iptp-cs#msg-issue-other-prompt "Issue Flow: Other - Free Text Prompt"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-20T12:00:00+03:00"
* payload[0].contentString = "Tafadhali andika tatizo lako kwa ufupi."
* language = #sw

Instance: IPTpSMSIssueOtherAckEnExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Other - Auto-Reply (EN)"
Description: "Auto-reply sent after the free-text concern is received (see IPTpIssueReportOtherExample)"
Usage: #example
* id = "iptp-sms-issue-other-ack-en"
* status = #completed
* category = $iptp-cs#msg-issue-other-ack "Issue Flow: Other - Auto-Reply"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-20T12:02:00+03:00"
* payload[0].contentString = "Thank you. A health worker may follow up."
* language = #en

Instance: IPTpSMSIssueOtherAckSwExample
InstanceOf: IPTpSMSCommunication
Title: "Issue Flow: Other - Auto-Reply (SW)"
Description: "Other-issue auto-reply, Kiswahili translation"
Usage: #example
* id = "iptp-sms-issue-other-ack-sw"
* status = #completed
* category = $iptp-cs#msg-issue-other-ack "Issue Flow: Other - Auto-Reply"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-04-20T12:02:00+03:00"
* payload[0].contentString = "Asante. Mhudumu wa afya anaweza kufuatilia."
* language = #sw

// ------------------------------------------------------------
// 5. STOP HANDLING (short code 25332)
// ------------------------------------------------------------

Instance: IPTpSMSStopAckEnExample
InstanceOf: IPTpSMSCommunication
Title: "STOP Acknowledgement (EN)"
Description: "Sent when the patient texts STOP; messaging_status = STOPPED, all scheduled messages cancelled"
Usage: #example
* id = "iptp-sms-stop-ack-en"
* status = #completed
* category = $iptp-cs#msg-stop-ack "STOP Acknowledgement"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-05-01T07:00:00+03:00"
* payload[0].contentString = "You have stopped malaria reminders. If you change your mind, inform your health worker."
* language = #en

Instance: IPTpSMSStopAckSwExample
InstanceOf: IPTpSMSCommunication
Title: "STOP Acknowledgement (SW)"
Description: "STOP acknowledgement, Kiswahili translation"
Usage: #example
* id = "iptp-sms-stop-ack-sw"
* status = #completed
* category = $iptp-cs#msg-stop-ack "STOP Acknowledgement"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-05-01T07:00:00+03:00"
* payload[0].contentString = "Umesitisha jumbe za ukumbusho za malaria. Ukibadilisha wazo, mjulishe mhudumu wa afya uweze kusajiliwa upya."
* language = #sw

// ------------------------------------------------------------
// 6. INFOAFYA BEHAVIOURAL SUPPORT MESSAGES (one-way, non-interactive)
// ------------------------------------------------------------

Instance: IPTpSMSInfoAfyaTrustEnExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #1: Trust (EN)"
Description: "Sent 24-48h after enrollment via the InfoAFYA sender ID"
Usage: #example
* id = "iptp-sms-infoafya-trust-en"
* status = #completed
* category = $iptp-cs#msg-infoafya-trust "InfoAFYA: Trust"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-03-18T09:00:00+03:00"
* payload[0].contentString = "You are taking important steps toward a healthy pregnancy. Your health clinic and county are here to support you."
* language = #en

Instance: IPTpSMSInfoAfyaTrustSwExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #1: Trust (SW)"
Description: "Trust message, Kiswahili translation"
Usage: #example
* id = "iptp-sms-infoafya-trust-sw"
* status = #completed
* category = $iptp-cs#msg-infoafya-trust "InfoAFYA: Trust"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-03-18T09:00:00+03:00"
* payload[0].contentString = "Umechukua hatua muhimu kwa ajili ya ujauzito wenye afya. Kliniki yako ya afya na kaunti ziko hapa kukusaidia."
* language = #sw

Instance: IPTpSMSInfoAfyaAutonomyEnExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #2: Autonomy Transition (EN)"
Description: "Sent 3-5 days after DOT (Dose 1) via the InfoAFYA sender ID"
Usage: #example
* id = "iptp-sms-infoafya-autonomy-en"
* status = #completed
* category = $iptp-cs#msg-infoafya-autonomy "InfoAFYA: Autonomy Transition"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-03-20T09:00:00+03:00"
* payload[0].contentString = "Your first malaria dose was taken at the clinic. The next doses are yours to take on your written date. Keep your booklet safe."
* language = #en

Instance: IPTpSMSInfoAfyaAutonomySwExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #2: Autonomy Transition (SW)"
Description: "Autonomy transition message, Kiswahili translation"
Usage: #example
* id = "iptp-sms-infoafya-autonomy-sw"
* status = #completed
* category = $iptp-cs#msg-infoafya-autonomy "InfoAFYA: Autonomy Transition"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-03-20T09:00:00+03:00"
* payload[0].contentString = "Dozi yako ya kwanza ya malaria ulipewa kliniki. Dozi zinazofuata utameza mwenyewe kulingana na tarehe iliyoandikwa. Hifadhi kitabu chako cha kliniki vizuri."
* language = #sw

Instance: IPTpSMSInfoAfyaNormEnExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #3: Norm Reinforcement (EN)"
Description: "Sent 7 days before the next dose via the InfoAFYA sender ID"
Usage: #example
* id = "iptp-sms-infoafya-norm-en"
* status = #completed
* category = $iptp-cs#msg-infoafya-norm "InfoAFYA: Norm Reinforcement"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-04-06T09:00:00+03:00"
* payload[0].contentString = "Many mothers protect their babies by taking malaria medicine every month. Staying on your date keeps your baby safer."
* language = #en

Instance: IPTpSMSInfoAfyaNormSwExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #3: Norm Reinforcement (SW)"
Description: "Norm reinforcement message, Kiswahili translation"
Usage: #example
* id = "iptp-sms-infoafya-norm-sw"
* status = #completed
* category = $iptp-cs#msg-infoafya-norm "InfoAFYA: Norm Reinforcement"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-04-06T09:00:00+03:00"
* payload[0].contentString = "Wamama wengi wanalinda watoto wao kwa kumeza dawa ya malaria kila mwezi. Ukizingatia tarehe yako ya dozi itasaidia kumlinda mtoto wako."
* language = #sw

Instance: IPTpSMSInfoAfyaIdentityEnExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #4: Identity Reinforcement (EN)"
Description: "Sent 3-5 days after Dose 2 confirmation via the InfoAFYA sender ID"
Usage: #example
* id = "iptp-sms-infoafya-identity-en"
* status = #completed
* category = $iptp-cs#msg-infoafya-identity "InfoAFYA: Identity Reinforcement"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-04-17T09:00:00+03:00"
* payload[0].contentString = "You have taken important steps to protect your baby. Each dose keeps you safe from malaria. Keep going."
* language = #en

Instance: IPTpSMSInfoAfyaIdentitySwExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #4: Identity Reinforcement (SW)"
Description: "Identity reinforcement message, Kiswahili translation"
Usage: #example
* id = "iptp-sms-infoafya-identity-sw"
* status = #completed
* category = $iptp-cs#msg-infoafya-identity "InfoAFYA: Identity Reinforcement"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-04-17T09:00:00+03:00"
* payload[0].contentString = "Umechukua hatua muhimu kumlinda mtoto wako. Kila dozi inakukinga dhidi ya malaria. Endelea hivyo."
* language = #sw

Instance: IPTpSMSInfoAfyaReassuranceEnExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #5: Side-Effect Reassurance (EN)"
Description: "Sent in the mid-cycle window between two IPTp doses via the InfoAFYA sender ID"
Usage: #example
* id = "iptp-sms-infoafya-reassurance-en"
* status = #completed
* category = $iptp-cs#msg-infoafya-reassurance "InfoAFYA: Side-Effect Reassurance"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-04-27T09:00:00+03:00"
* payload[0].contentString = "Most women feel well after taking Malaria prevention doses. Mild discomfort can pass quickly. If very unwell, seek care early."
* language = #en

Instance: IPTpSMSInfoAfyaReassuranceSwExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #5: Side-Effect Reassurance (SW)"
Description: "Side-effect reassurance message, Kiswahili translation"
Usage: #example
* id = "iptp-sms-infoafya-reassurance-sw"
* status = #completed
* category = $iptp-cs#msg-infoafya-reassurance "InfoAFYA: Side-Effect Reassurance"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-04-27T09:00:00+03:00"
* payload[0].contentString = "Wanawake wengi hujihisi vizuri baada ya kutumia SP. Madhara madogo mara nyingi huisha haraka. Ukijisikia vibaya sana, pata usaidizi mapema."
* language = #sw

Instance: IPTpSMSInfoAfyaCompletionEnExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #6: Completion Mindset (EN)"
Description: "Sent 7 days before the final dose cycle via the InfoAFYA sender ID"
Usage: #example
* id = "iptp-sms-infoafya-completion-en"
* status = #completed
* category = $iptp-cs#msg-infoafya-completion "InfoAFYA: Completion Mindset"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-06-01T09:00:00+03:00"
* payload[0].contentString = "Completing your remaining dose keeps you and your baby protected through pregnancy. Protection works even if you feel well."
* language = #en

Instance: IPTpSMSInfoAfyaCompletionSwExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #6: Completion Mindset (SW)"
Description: "Completion mindset message, Kiswahili translation"
Usage: #example
* id = "iptp-sms-infoafya-completion-sw"
* status = #completed
* category = $iptp-cs#msg-infoafya-completion "InfoAFYA: Completion Mindset"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-06-01T09:00:00+03:00"
* payload[0].contentString = "Ukimaliza dozi zako zilizobaki, unajilinda wewe na mtoto wako wakati wa ujauzito. Kinga inafanya kazi hata kama unajihisi vizuri."
* language = #sw

Instance: IPTpSMSInfoAfyaAncContinuityEnExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #7: ANC Continuity (EN)"
Description: "Sent after final dose confirmation via the InfoAFYA sender ID"
Usage: #example
* id = "iptp-sms-infoafya-anc-continuity-en"
* status = #completed
* category = $iptp-cs#msg-infoafya-anc-continuity "InfoAFYA: ANC Continuity"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-06-09T09:00:00+03:00"
* payload[0].contentString = "You have taken important steps to protect yourself and your baby. Keep attending your ANC visits and sleeping under your net every night."
* language = #en

Instance: IPTpSMSInfoAfyaAncContinuitySwExample
InstanceOf: IPTpSMSCommunication
Title: "InfoAFYA #7: ANC Continuity (SW)"
Description: "ANC continuity message, Kiswahili translation"
Usage: #example
* id = "iptp-sms-infoafya-anc-continuity-sw"
* status = #completed
* category = $iptp-cs#msg-infoafya-anc-continuity "InfoAFYA: ANC Continuity"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "InfoAFYA"
* sent = "2026-06-09T09:00:00+03:00"
* payload[0].contentString = "Umechukua hatua muhimu kujilinda pamoja na mtoto wako. Endelea kuhudhuria kliniki za wajawazito na kulala chini ya neti kila usiku."
* language = #sw

// ------------------------------------------------------------
// 7. FEEDBACK & GRATITUDE (short code 25332)
// ------------------------------------------------------------

Instance: IPTpSMSFeedbackPromptEnExample
InstanceOf: IPTpSMSCommunication
Title: "Feedback Prompt (EN)"
Description: "Sent 5 days after the final dose confirmation"
Usage: #example
* id = "iptp-sms-feedback-prompt-en"
* status = #completed
* category = $iptp-cs#msg-feedback-prompt "Feedback Prompt"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-06-13T08:00:00+03:00"
* payload[0].contentString = "You have taken important steps to protect yourself and your baby from malaria. Did these reminders support you? 1 Yes 2 No"
* language = #en

Instance: IPTpSMSFeedbackPromptSwExample
InstanceOf: IPTpSMSCommunication
Title: "Feedback Prompt (SW)"
Description: "Feedback prompt, Kiswahili translation"
Usage: #example
* id = "iptp-sms-feedback-prompt-sw"
* status = #completed
* category = $iptp-cs#msg-feedback-prompt "Feedback Prompt"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-06-13T08:00:00+03:00"
* payload[0].contentString = "Umechukua hatua muhimu kujikinga pamoja na mtoto wako dhidi ya malaria. Je, jumbe hizi za ukumbusho zilikusaidia? 1 Ndiyo 2 La"
* language = #sw

Instance: IPTpSMSFeedbackYesAckEnExample
InstanceOf: IPTpSMSCommunication
Title: "Feedback Ack: Yes (EN)"
Description: "Sent after the patient replies 1 (Yes); see IPTpFeedbackYesExample for the structured response"
Usage: #example
* id = "iptp-sms-feedback-yes-ack-en"
* status = #completed
* category = $iptp-cs#msg-feedback-yes-ack "Feedback Ack: Yes"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-06-13T09:01:00+03:00"
* payload[0].contentString = "Thank you for protecting yourself and your baby. Your effort matters. We wish you a safe and healthy pregnancy."
* language = #en

Instance: IPTpSMSFeedbackYesAckSwExample
InstanceOf: IPTpSMSCommunication
Title: "Feedback Ack: Yes (SW)"
Description: "Feedback Yes acknowledgement, Kiswahili translation"
Usage: #example
* id = "iptp-sms-feedback-yes-ack-sw"
* status = #completed
* category = $iptp-cs#msg-feedback-yes-ack "Feedback Ack: Yes"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-06-13T09:01:00+03:00"
* payload[0].contentString = "Asante kwa kujilinda pamoja na mtoto wako. Juhudi yako ni muhimu. Tunakutakia ujauzito salama na wenye afya."
* language = #sw

Instance: IPTpSMSFeedbackNoAckEnExample
InstanceOf: IPTpSMSCommunication
Title: "Feedback Ack: No (EN)"
Description: "Sent after the patient replies 2 (No); see IPTpFeedbackNoExample for the structured response"
Usage: #example
* id = "iptp-sms-feedback-no-ack-en"
* status = #completed
* category = $iptp-cs#msg-feedback-no-ack "Feedback Ack: No"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-06-13T09:06:00+03:00"
* payload[0].contentString = "Thank you. Any suggestions on how we can improve service delivery to pregnant women? Your feedback helps improve care for mothers and babies."
* language = #en

Instance: IPTpSMSFeedbackNoAckSwExample
InstanceOf: IPTpSMSCommunication
Title: "Feedback Ack: No (SW)"
Description: "Feedback No acknowledgement, Kiswahili translation"
Usage: #example
* id = "iptp-sms-feedback-no-ack-sw"
* status = #completed
* category = $iptp-cs#msg-feedback-no-ack "Feedback Ack: No"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sender.display = "Short code 25332"
* sent = "2026-06-13T09:06:00+03:00"
* payload[0].contentString = "Asante. Je, una maoni jinsi tunaweza kuboresha huduma kwa wajawazito? Maoni yako yatasaidia kuboresha huduma kwa akina mama na watoto."
* language = #sw
