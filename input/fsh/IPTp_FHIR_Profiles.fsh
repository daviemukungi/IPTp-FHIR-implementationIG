// ============================================================
// IPTp-SP Digital Support System - FHIR Implementation Guide
// Kakamega Pilot – Shinyalu & Ikolomani
// FSH (FHIR Shorthand) Profiles
// ============================================================

Alias: $loinc = http://loinc.org
Alias: $snomed = http://snomed.info/sct
Alias: $icd10 = http://hl7.org/fhir/sid/icd-10
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $medication-request-category = http://terminology.hl7.org/CodeSystem/medicationrequest-category
Alias: $iptp-cs = http://iptp.kemri.go.ke/fhir/CodeSystem/iptp-code-system

// ============================================================
// CODE SYSTEMS
// ============================================================

CodeSystem: IPTpCodeSystem
Id: iptp-code-system
Title: "IPTp-SP Code System"
Description: "Code system for IPTp-SP Digital Support System concepts"
* ^url = "http://iptp.kemri.go.ke/fhir/CodeSystem/iptp-code-system"
* ^status = #active
* ^caseSensitive = true
* #iptp-enrollment       "IPTp Enrollment"           "Registration of a pregnant woman into the IPTp-SP program"
* #iptp-dose-planned     "IPTp Dose Planned"          "A future planned IPTp-SP dose (ServiceRequest/CarePlan activity type code)"
* #iptp-dot              "IPTp DOT"                   "Directly Observed Therapy dose administered at clinic"
* #iptp-self-admin       "IPTp Self-Administration"   "Self-administered IPTp dose at home"
* #consent-sms           "SMS Consent"                "Consent to receive SMS reminders"
* #language-english      "English"                    "Patient prefers English language messages"
* #language-kiswahili    "Kiswahili"                  "Patient prefers Kiswahili language messages"
* #ga-early              "Early GA Band"              "Gestational age 13–20 weeks"
* #ga-mid                "Mid GA Band"                "Gestational age 21–27 weeks"
* #adr-mild              "Mild ADR"                   "Mild adverse drug reaction"
* #adr-severe            "Severe ADR"                 "Severe adverse drug reaction requiring immediate care"
* #chp-followup          "CHP Follow-up"              "Community Health Promoter follow-up triggered"
* #reminder-t3           "T-3 Reminder"               "Reminder sent 3 days before dose date"
* #reminder-t0           "T-0 Reminder"               "Reminder sent on dose day"
* #reminder-24h          "24h Nudge"                  "24-hour follow-up nudge"
* #reminder-72h          "72h Escalation"             "72-hour escalation to CHP queue"

// Dose confirmation status (T-0 / 24h / 72h confirmation engine)
* #confirmation-confirmed "Dose Confirmed"            "Patient replied 1 (took it); dose confirmed"
* #confirmation-pending   "Dose Confirmation Pending" "Patient replied 2 (not yet) or has not yet replied; awaiting confirmation"
* #confirmation-missed    "Dose Confirmation Missed"  "No confirmation received after 72 hours; CHP notified"

// Messaging status (STOP handling)
* #messaging-active      "Messaging Active"           "Patient is actively receiving SMS reminders"
* #messaging-stopped     "Messaging Stopped"          "Patient sent STOP; all scheduled messages cancelled"

// Issue report types (Have-an-Issue flow, Reply 3)
* #issue-type-lost-medicine "Lost Medicine"            "Patient reports lost or misplaced IPTp-SP tablets"
* #issue-type-other         "Other Issue"               "Other free-text patient-reported concern (issue_text encrypted, manual_review_flag = TRUE)"
* #resolution-open          "Open"                      "Issue is open and unresolved"
* #resolution-resolved      "Resolved"                  "Issue has been resolved"

// Pregnancy outcome (automatic STOP conditions)
* #pregnancy-outcome-delivery "Delivery"                "Pregnancy ended in delivery; messaging stops"
* #pregnancy-outcome-loss     "Pregnancy Loss"          "Pregnancy ended in loss; messaging stops"

// Program feedback
* #feedback-program-helpfulness "IPTp Reminder Program Helpfulness" "Whether the patient found the SMS reminders supportive"

// SMS payload categories (Channel 1 shortcode 25332 and Channel 2 InfoAFYA)
* #msg-onboarding-enrollment       "Onboarding: Enrollment Confirmation"     "Onboarding message 1 sent on short code immediately after USSD enrollment"
* #msg-onboarding-how-it-works     "Onboarding: How It Works"                "Onboarding message 2"
* #msg-onboarding-how-to-take      "Onboarding: How to Take SP"              "Onboarding message 3"
* #msg-onboarding-safety-bridge    "Onboarding: Safety + InfoAFYA Bridge"    "Onboarding message 4"
* #msg-confirmation-ack-taken      "Confirmation Ack: Took It"               "Sent after patient replies 1 (took it)"
* #msg-confirmation-ack-pending    "Confirmation Ack: Not Yet"               "Sent after patient replies 2 (not yet)"
* #msg-issue-problem-type          "Issue Flow: Problem Type Prompt"         "Have-an-issue step 1 prompt"
* #msg-issue-side-effect-severity  "Issue Flow: Side Effect Severity Prompt" "Have-an-issue side-effect severity prompt"
* #msg-issue-mild-response         "Issue Flow: Mild Side Effect Response"   "Response sent for mild side effects"
* #msg-issue-severe-response       "Issue Flow: Severe Side Effect Response" "Response sent for severe side effects"
* #msg-issue-lost-medicine-response "Issue Flow: Lost Medicine Response"     "Response sent for lost medicine reports"
* #msg-issue-other-prompt          "Issue Flow: Other - Free Text Prompt"    "Prompt asking patient to type their concern"
* #msg-issue-other-ack             "Issue Flow: Other - Auto-Reply"          "Auto-reply after free-text concern received"
* #msg-stop-ack                    "STOP Acknowledgement"                    "Sent when patient texts STOP"
* #msg-infoafya-trust              "InfoAFYA: Trust"                         "24-48h post enrollment"
* #msg-infoafya-autonomy           "InfoAFYA: Autonomy Transition"           "3-5 days post DOT"
* #msg-infoafya-norm               "InfoAFYA: Norm Reinforcement"            "7 days before next dose"
* #msg-infoafya-identity           "InfoAFYA: Identity Reinforcement"        "3-5 days after Dose 2 confirmation"
* #msg-infoafya-reassurance        "InfoAFYA: Side-Effect Reassurance"       "Mid-cycle window between two IPTp doses"
* #msg-infoafya-completion         "InfoAFYA: Completion Mindset"            "7 days before final cycle"
* #msg-infoafya-anc-continuity     "InfoAFYA: ANC Continuity"                "After final dose confirmation"
* #msg-feedback-prompt             "Feedback Prompt"                         "Sent 5 days after final dose confirmation"
* #msg-feedback-yes-ack            "Feedback Ack: Yes"                       "Sent when patient replies 1 (Yes, supported)"
* #msg-feedback-no-ack             "Feedback Ack: No"                        "Sent when patient replies 2 (No), requests suggestions"

// ============================================================
// VALUE SETS
// ============================================================

ValueSet: IPTpDoseStatusVS
Id: iptp-dose-status-vs
Title: "IPTp Dose Confirmation Status Value Set"
Description: "Status codes for tracking whether a self-administered IPTp-SP dose has been confirmed by the patient via SMS reply (T-0 / 24h / 72h confirmation engine)"
* $iptp-cs#confirmation-confirmed
* $iptp-cs#confirmation-pending
* $iptp-cs#confirmation-missed

ValueSet: IPTpAdministrationMethodVS
Id: iptp-administration-method-vs
Title: "IPTp Administration Method Value Set"
Description: "Whether a dose was given via Directly Observed Therapy at clinic or self-administered at home"
* $iptp-cs#iptp-dot
* $iptp-cs#iptp-self-admin

ValueSet: IPTpMessagingStatusVS
Id: iptp-messaging-status-vs
Title: "IPTp Messaging Status Value Set"
Description: "Whether SMS reminders are currently active or have been stopped (STOP handling)"
* $iptp-cs#messaging-active
* $iptp-cs#messaging-stopped

ValueSet: IPTpIssueTypeVS
Id: iptp-issue-type-vs
Title: "IPTp Issue Type Value Set"
Description: "Non-ADR issue types reportable via the Have-an-Issue SMS flow"
* $iptp-cs#issue-type-lost-medicine
* $iptp-cs#issue-type-other

ValueSet: IPTpResolutionStatusVS
Id: iptp-resolution-status-vs
Title: "IPTp Resolution Status Value Set"
Description: "Whether a reported issue is still open or has been resolved"
* $iptp-cs#resolution-open
* $iptp-cs#resolution-resolved

ValueSet: IPTpPregnancyOutcomeVS
Id: iptp-pregnancy-outcome-vs
Title: "IPTp Pregnancy Outcome Value Set"
Description: "Outcome that automatically stops IPTp-SP messaging"
* $iptp-cs#pregnancy-outcome-delivery
* $iptp-cs#pregnancy-outcome-loss

ValueSet: IPTpMessageCategoryVS
Id: iptp-message-category-vs
Title: "IPTp SMS Message Category Value Set"
Description: "Categories of outbound/inbound SMS messages exchanged on the dedicated short code (25332) or the InfoAFYA sender ID"
* $iptp-cs#reminder-t3
* $iptp-cs#reminder-t0
* $iptp-cs#reminder-24h
* $iptp-cs#reminder-72h
* $iptp-cs#msg-onboarding-enrollment
* $iptp-cs#msg-onboarding-how-it-works
* $iptp-cs#msg-onboarding-how-to-take
* $iptp-cs#msg-onboarding-safety-bridge
* $iptp-cs#msg-confirmation-ack-taken
* $iptp-cs#msg-confirmation-ack-pending
* $iptp-cs#msg-issue-problem-type
* $iptp-cs#msg-issue-side-effect-severity
* $iptp-cs#msg-issue-mild-response
* $iptp-cs#msg-issue-severe-response
* $iptp-cs#msg-issue-lost-medicine-response
* $iptp-cs#msg-issue-other-prompt
* $iptp-cs#msg-issue-other-ack
* $iptp-cs#msg-stop-ack
* $iptp-cs#msg-infoafya-trust
* $iptp-cs#msg-infoafya-autonomy
* $iptp-cs#msg-infoafya-norm
* $iptp-cs#msg-infoafya-identity
* $iptp-cs#msg-infoafya-reassurance
* $iptp-cs#msg-infoafya-completion
* $iptp-cs#msg-infoafya-anc-continuity
* $iptp-cs#msg-feedback-prompt
* $iptp-cs#msg-feedback-yes-ack
* $iptp-cs#msg-feedback-no-ack

ValueSet: IPTpLanguagePreferenceVS
Id: iptp-language-preference-vs
Title: "IPTp Language Preference Value Set"
Description: "Language preference options for IPTp SMS communications"
* $iptp-cs#language-english
* $iptp-cs#language-kiswahili

ValueSet: IPTpGABandVS
Id: iptp-ga-band-vs
Title: "IPTp Gestational Age Band Value Set"
Description: "Gestational age bands for IPTp eligibility"
* $iptp-cs#ga-early
* $iptp-cs#ga-mid

ValueSet: IPTpADRSeverityVS
Id: iptp-adr-severity-vs
Title: "IPTp ADR Severity Value Set"
Description: "Severity codes for adverse drug reactions in the IPTp program"
* $iptp-cs#adr-mild
* $iptp-cs#adr-severe

ValueSet: IPTpReminderTypeVS
Id: iptp-reminder-type-vs
Title: "IPTp Reminder Type Value Set"
Description: "Types of reminders sent to enrolled patients"
* $iptp-cs#reminder-t3
* $iptp-cs#reminder-t0
* $iptp-cs#reminder-24h
* $iptp-cs#reminder-72h

// ============================================================
// EXTENSIONS
// ============================================================

Extension: IPTpANCNumberHash
Id: iptp-anc-number-hash
Title: "IPTp ANC Number Hash"
Description: "Hashed ANC number for privacy-preserving de-duplication"
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only string
* valueString ^short = "SHA-256 hash of the ANC number"

Extension: IPTpLanguagePreference
Id: iptp-language-preference
Title: "IPTp Language Preference"
Description: "Patient's preferred language for SMS communications"
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept from IPTpLanguagePreferenceVS (required)

Extension: IPTpSMSConsent
Id: iptp-sms-consent
Title: "IPTp SMS Consent"
Description: "Records whether the patient has consented to receive SMS reminders"
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only boolean

Extension: IPTpMessagingStatus
Id: iptp-messaging-status
Title: "IPTp Messaging Status"
Description: "Current SMS messaging status for the patient (ACTIVE / STOPPED)"
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* value[x] only CodeableConcept
* valueCodeableConcept from IPTpMessagingStatusVS (required)

Extension: IPTpProviderMSISDN
Id: iptp-provider-msisdn
Title: "IPTp Provider MSISDN"
Description: "Whitelisted mobile number of the ANC provider"
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string

Extension: IPTpGABand
Id: iptp-ga-band
Title: "IPTp Gestational Age Band"
Description: "Derived gestational age band at enrollment (EARLY 13–20 or MID 21–27)"
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* value[x] only CodeableConcept
* valueCodeableConcept from IPTpGABandVS (required)

Extension: IPTpDoseNumber
Id: iptp-dose-number
Title: "IPTp Dose Number"
Description: "Sequential dose number in the IPTp schedule (1–4+)"
* ^context[0].type = #element
* ^context[0].expression = "MedicationAdministration"
* ^context[1].type = #element
* ^context[1].expression = "ServiceRequest"
* value[x] only positiveInt

Extension: IPTpAdministrationMethod
Id: iptp-administration-method
Title: "IPTp Administration Method"
Description: "Whether the dose was DOT (clinic) or self-administered (home)"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* value[x] only CodeableConcept
* valueCodeableConcept from IPTpAdministrationMethodVS (extensible)

Extension: IPTpConfirmationStatus
Id: iptp-confirmation-status
Title: "IPTp Dose Confirmation Status"
Description: "Tracks the T-0 / 24h / 72h confirmation engine outcome for a self-administered dose (confirmed / pending / missed)"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* value[x] only CodeableConcept
* valueCodeableConcept from IPTpDoseStatusVS (required)

Extension: IPTpSpacingValidFlag
Id: iptp-spacing-valid-flag
Title: "IPTp Dose Spacing Valid Flag"
Description: "TRUE if the confirmed dose date respects the minimum 28-day spacing from the previous dose; computed when confirmation_status = confirmation-confirmed"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* value[x] only boolean

Extension: IPTpResolutionStatus
Id: iptp-resolution-status
Title: "IPTp Issue Resolution Status"
Description: "Whether a reported issue (ADR or non-ADR) is open or resolved"
* ^context.type = #element
* ^context.expression = "Observation"
* value[x] only CodeableConcept
* valueCodeableConcept from IPTpResolutionStatusVS (required)

Extension: IPTpManualReviewFlag
Id: iptp-manual-review-flag
Title: "IPTp Manual Review Flag"
Description: "TRUE when a free-text 'Other' issue report requires manual review by a health worker"
* ^context.type = #element
* ^context.expression = "Observation"
* value[x] only boolean

Extension: IPTpPregnancyOutcome
Id: iptp-pregnancy-outcome
Title: "IPTp Pregnancy Outcome"
Description: "Delivery or pregnancy loss outcome that automatically stops IPTp-SP messaging"
* ^context.type = #element
* ^context.expression = "Condition"
* value[x] only CodeableConcept
* valueCodeableConcept from IPTpPregnancyOutcomeVS (required)

Extension: IPTpReminderAnchor
Id: iptp-reminder-anchor
Title: "IPTp Reminder Anchor"
Description: "Type of reminder that triggered a communication"
* ^context.type = #element
* ^context.expression = "Communication"
* value[x] only CodeableConcept
* valueCodeableConcept from IPTpReminderTypeVS (required)

Extension: IPTpCHPFollowupFlag
Id: iptp-chp-followup-flag
Title: "IPTp CHP Follow-up Flag"
Description: "Indicates whether a Community Health Promoter follow-up has been triggered"
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* value[x] only boolean

// ============================================================
// PROFILE 1: IPTp Patient
// ============================================================

Profile: IPTpPatient
Parent: Patient
Id: iptp-patient
Title: "IPTp Enrolled Patient"
Description: "A pregnant woman enrolled in the IPTp-SP Digital Support System. 
              Captures phone number, ANC number hash, language preference, and SMS consent."

* extension contains
    IPTpANCNumberHash named ancNumberHash 1..1 MS and
    IPTpLanguagePreference named languagePreference 1..1 MS and
    IPTpSMSConsent named smsConsent 1..1 MS

// Phone number is mandatory
* telecom 1..* MS
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom contains phone 1..1 MS
* telecom[phone].system = #phone
* telecom[phone].value 1..1 MS
* telecom[phone].value ^short = "Kenyan mobile number (07XX XXX XXX or 0XXX XXX XXX)"

// Gender is required (pregnancy program)
* gender 1..1 MS
* gender = #female

// Active flag
* active 1..1 MS

// Communication language
* communication MS
* communication.language MS
* communication.preferred MS

// ============================================================
// PROFILE 2: IPTp ANC Provider (Practitioner)
// ============================================================

Profile: IPTpPractitioner
Parent: Practitioner
Id: iptp-practitioner
Title: "IPTp ANC Provider"
Description: "An ANC health worker whitelisted to use the IPTp USSD enrollment system. 
              Their MSISDN must be on the approved whitelist before access is granted."

* extension contains
    IPTpProviderMSISDN named providerMSISDN 1..1 MS

* identifier 1..* MS
* identifier ^short = "Provider identifier (national ID or facility staff ID)"

* name 1..* MS
* telecom 1..* MS
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom contains phone 1..1 MS
* telecom[phone].system = #phone
* telecom[phone].value 1..1 MS

* active 1..1 MS

// ============================================================
// PROFILE 3: IPTp Facility (Location)
// ============================================================

Profile: IPTpFacility
Parent: Location
Id: iptp-facility
Title: "IPTp Health Facility"
Description: "An ANC health facility in the IPTp program. 
              The facility is auto-bound to the provider at enrollment time."

* name 1..1 MS
* status 1..1 MS
* status = #active

* type 1..* MS
* type ^short = "Facility type (e.g. ANC clinic)"

* address MS
* address.district MS
* address.district ^short = "Sub-county (e.g. Shinyalu, Ikolomani)"
* address.state MS
* address.state ^short = "County (e.g. Kakamega)"

* managingOrganization MS

// ============================================================
// PROFILE 4: IPTp Enrollment (EpisodeOfCare)
// ============================================================

Profile: IPTpEnrollment
Parent: EpisodeOfCare
Id: iptp-enrollment
Title: "IPTp Enrollment Episode"
Description: "Represents the enrollment of a pregnant woman into the IPTp-SP Digital 
              Support System. Tracks enrollment status, gestational age band, messaging 
              status, and CHP follow-up flag."

* extension contains
    IPTpMessagingStatus named messagingStatus 1..1 MS and
    IPTpGABand named gestationalAgeBand 1..1 MS and
    IPTpCHPFollowupFlag named chpFollowupFlag 0..1 MS

* status 1..1 MS
* status from http://hl7.org/fhir/ValueSet/episode-of-care-status (required)
* status ^short = "active | finished | cancelled (use 'cancelled' for STOP)"

* type 1..* MS
* type ^short = "IPTp enrollment type"

* diagnosis MS
* diagnosis.condition MS
* diagnosis.condition ^short = "Reference to pregnancy condition"

* patient 1..1 MS
* patient only Reference(IPTpPatient)

* managingOrganization MS
* managingOrganization only Reference(Organization)

* careManager MS
* careManager only Reference(IPTpPractitioner)

* period 1..1 MS
* period.start 1..1 MS
* period.start ^short = "Date of enrollment (must be 13–27 weeks GA)"

// ============================================================
// PROFILE 5: IPTp Pregnancy Condition
// ============================================================

Profile: IPTpPregnancyCondition
Parent: Condition
Id: iptp-pregnancy-condition
Title: "IPTp Pregnancy Condition"
Description: "A confirmed pregnancy condition for a woman enrolled in the IPTp-SP program."

* extension contains
    IPTpPregnancyOutcome named pregnancyOutcome 0..1 MS
* extension[pregnancyOutcome] ^short = "Set when delivery or pregnancy loss is logged; clinicalStatus should move to resolved and EpisodeOfCare/messaging stopped automatically"

* clinicalStatus 1..1 MS
* clinicalStatus ^short = "active while pregnant; resolved once a delivery or pregnancy-loss outcome is logged via extension[pregnancyOutcome]"

* code 1..1 MS
* code = $snomed#77386006 "Pregnant"

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* onsetDateTime MS
* onsetDateTime ^short = "LMP or estimated pregnancy start date"

* recordedDate 1..1 MS

* stage MS
* stage.summary MS
* stage.summary ^short = "Gestational age at enrollment in weeks"

// ============================================================
// PROFILE 6: IPTp Gestational Age Observation
// ============================================================

Profile: IPTpGestationalAgeObservation
Parent: Observation
Id: iptp-gestational-age-observation
Title: "IPTp Gestational Age Observation"
Description: "Captures the gestational age (in weeks) of the pregnant woman at the 
              time of IPTp enrollment. Must be 13–27 weeks to be eligible."

* status 1..1 MS
* status = #final

* category 1..* MS
* category = $observation-category#exam

* code 1..1 MS
* code = $loinc#11885-1

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* effective[x] 1..1 MS
* effectiveDateTime MS

* value[x] 1..1 MS
* valueQuantity MS
* valueQuantity.value 1..1 MS
* valueQuantity.value ^short = "Gestational age in weeks (must be 13–27)"
* valueQuantity.unit = "weeks"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #wk

* note MS
* note ^short = "GA band: EARLY (13–20) or MID (21–27)"

// ============================================================
// PROFILE 7: IPTp Dose History Observation
// ============================================================

Profile: IPTpDoseHistoryObservation
Parent: Observation
Id: iptp-dose-history-observation
Title: "IPTp Prior Dose History Observation"
Description: "Records the number of IPTp doses the patient had already received 
              before enrollment. Used to derive which dose is being administered today 
              (current_dose_given_today = iptp_history + 1)."

* status 1..1 MS
* status = #final

* category 1..* MS
* category = $observation-category#therapy

* code 1..1 MS
* code = $iptp-cs#iptp-enrollment
* code ^short = "IPTp prior dose history count"

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* effectiveDateTime 1..1 MS

* value[x] 1..1 MS
* valueInteger MS
* valueInteger ^short = "Number of IPTp doses received before this enrollment (0–3)"
* valueInteger ^minValueInteger = 0
* valueInteger ^maxValueInteger = 3

// ============================================================
// PROFILE 8: IPTp Medication (SP Tablets)
// ============================================================

Profile: IPTpMedication
Parent: Medication
Id: iptp-medication
Title: "IPTp SP Medication"
Description: "Sulfadoxine-Pyrimethamine (SP) medication used in the IPTp program. 
              Each dose consists of 3 tablets taken together."

* code 1..1 MS
* code = $snomed#372723002 "Sulfadoxine + pyrimethamine"
* code ^short = "SP (Sulfadoxine-Pyrimethamine)"

* status 1..1 MS
* status = #active

* form MS
* form = $snomed#385055001 "Tablet"

* ingredient MS
* ingredient ^short = "Active ingredients: Sulfadoxine 500mg + Pyrimethamine 25mg per tablet"
* ingredient.item[x] MS
* ingredient.strength MS
* ingredient.strength.numerator MS
* ingredient.strength.denominator MS

// ============================================================
// PROFILE 9: IPTp Dose Administration (MedicationAdministration)
// ============================================================

Profile: IPTpDoseAdministration
Parent: MedicationAdministration
Id: iptp-dose-administration
Title: "IPTp Dose Administration"
Description: "Records a single IPTp-SP dose administration event. Captures whether 
              the dose was given via DOT at clinic or self-administered at home, 
              along with the dose number in the sequence."

* extension contains
    IPTpDoseNumber named doseNumber 1..1 MS and
    IPTpAdministrationMethod named administrationMethod 1..1 MS and
    IPTpConfirmationStatus named confirmationStatus 0..1 MS and
    IPTpSpacingValidFlag named spacingValidFlag 0..1 MS

* extension[confirmationStatus] ^short = "Set for self-admin doses only: confirmation-pending on T-0, confirmation-confirmed on Reply 1, confirmation-missed after 72h with no reply"
* extension[spacingValidFlag] ^short = "Computed when confirmationStatus = confirmation-confirmed; TRUE if ≥28 days since previous dose"

* status 1..1 MS
* status from http://hl7.org/fhir/ValueSet/medication-admin-status (required)
* status ^short = "completed | not-done | in-progress"

* medication[x] 1..1 MS
* medicationReference only Reference(IPTpMedication)

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* effective[x] 1..1 MS
* effectiveDateTime MS
* effectiveDateTime ^short = "Actual or planned date of dose administration"

* performer MS
* performer.actor MS
* performer.actor only Reference(IPTpPractitioner)
* performer.actor ^short = "Required only for DOT doses; omit for self-admin"

* dosage 1..1 MS
* dosage.dose MS
* dosage.dose.value = 3
* dosage.dose.unit = "tablet"
* dosage.dose ^short = "3 SP tablets taken together"
* dosage.route MS
* dosage.route = $snomed#26643006 "Oral route"
* dosage.text ^short = "Swallow whole. With or without food."

* note MS
* note ^short = "Additional notes (e.g. confirmed via SMS reply 1)"

// ============================================================
// PROFILE 10: IPTp Dose Schedule (ServiceRequest)
// ============================================================

Profile: IPTpDoseSchedule
Parent: ServiceRequest
Id: iptp-dose-schedule
Title: "IPTp Planned Dose Schedule"
Description: "Represents a planned future IPTp-SP dose. Only one future planned dose 
              is stored at a time. Status transitions from 'active' to 'completed' 
              or 'revoked' based on patient response."

* extension contains
    IPTpDoseNumber named doseNumber 1..1 MS

* status 1..1 MS
* status from http://hl7.org/fhir/ValueSet/request-status (required)
* status ^short = "active (planned) | completed | revoked (missed)"

* intent 1..1 MS
* intent = #plan

* code 1..1 MS
* code = $iptp-cs#iptp-dose-planned

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* occurrenceDateTime 1..1 MS
* occurrenceDateTime ^short = "Planned dose date (≥28 days from previous dose)"

* requester MS
* requester only Reference(IPTpPractitioner)

* locationReference MS
* locationReference only Reference(IPTpFacility)

* note MS
* note ^short = "Dose spacing note: minimum 28 days from last dose"

// ============================================================
// PROFILE 11: IPTp SMS Communication
// ============================================================

Profile: IPTpSMSCommunication
Parent: Communication
Id: iptp-sms-communication
Title: "IPTp SMS Communication"
Description: "Represents an SMS message sent to or received from an enrolled patient 
              via the dedicated short code (25332) or InfoAFYA sender ID. Captures 
              the message type, language, and reminder anchor."

* extension contains
    IPTpReminderAnchor named reminderAnchor 0..1 MS

* status 1..1 MS
* status from http://hl7.org/fhir/ValueSet/event-status (required)

* category 1..* MS
* category from IPTpMessageCategoryVS (extensible)
* category ^short = "Specific message identity, e.g. msg-onboarding-enrollment, reminder-t0, msg-infoafya-trust"

* medium 1..* MS
* medium ^short = "SMS"
* medium = http://terminology.hl7.org/CodeSystem/v3-ParticipationMode#WRITTEN "written"

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* sender MS
* sender ^short = "Short code 25332 or InfoAFYA sender"

* recipient 1..* MS
* recipient only Reference(IPTpPatient)

* sent MS
* sent ^short = "DateTime message was sent"

* received MS
* received ^short = "DateTime reply was received (if applicable)"

* payload 1..* MS
* payload.content[x] MS
* payload.contentString MS
* payload.contentString ^short = "SMS message content in English or Kiswahili"

* language MS
* language ^short = "en (English) or sw (Kiswahili)"

* note MS
* note ^short = "Channel: shortcode (interactive) or InfoAFYA (one-way)"

// ============================================================
// PROFILE 12: IPTp Adverse Drug Reaction (ADR)
// ============================================================

Profile: IPTpADRObservation
Parent: Observation
Id: iptp-adr-observation
Title: "IPTp Adverse Drug Reaction Observation"
Description: "Records an adverse drug reaction (ADR) reported by the patient after 
              taking an IPTp-SP dose. Captures severity (mild or severe) and triggers 
              appropriate care pathways."

* status 1..1 MS
* status = #final

* category 1..* MS
* category = $observation-category#survey
* category ^short = "Patient-reported ADR via SMS reply 3 → option 1"

* code 1..1 MS
* code = $snomed#281647001

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* effectiveDateTime 1..1 MS

* value[x] 1..1 MS
* valueCodeableConcept MS
* valueCodeableConcept from IPTpADRSeverityVS (required)
* valueCodeableConcept ^short = "adr-mild | adr-severe"

* component MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains symptomDescription 0..1 MS
* component[symptomDescription].code = $loinc#75326-9 "Problem"
* component[symptomDescription].value[x] only string
* component[symptomDescription].valueString ^short = "Free text symptom description (e.g. severe rash, swelling, difficulty breathing)"

* note MS
* note ^short = "Action: mild → CHP advice; severe → immediate facility referral"

// ============================================================
// PROFILE 13: IPTp CHP Follow-Up Task
// ============================================================

Profile: IPTpCHPFollowUpTask
Parent: Task
Id: iptp-chp-followup-task
Title: "IPTp CHP Follow-Up Task"
Description: "A task assigned to a Community Health Promoter (CHP) when a patient 
              has not confirmed their dose after 72 hours, reported a lost medicine, 
              or triggered a severe ADR."

* status 1..1 MS
* status from http://hl7.org/fhir/ValueSet/task-status (required)
* status ^short = "requested | in-progress | completed | cancelled"

* intent 1..1 MS
* intent = #order

* code 1..1 MS
* code = $iptp-cs#chp-followup

* description 1..1 MS
* description ^short = "Reason for CHP follow-up (72h non-response, lost medicine, severe ADR, etc.)"

* for 1..1 MS
* for only Reference(IPTpPatient)

* requester MS
* requester ^short = "System or facility triggering the task"

* owner MS
* owner only Reference(IPTpPractitioner)
* owner ^short = "Assigned Community Health Promoter"

* authoredOn 1..1 MS

* lastModified MS

* restriction MS
* restriction.period MS
* restriction.period ^short = "Expected follow-up window"

* note MS
* note ^short = "Additional context for the CHP"

// ============================================================
// PROFILE 14: IPTp Consent
// ============================================================

Profile: IPTpConsent
Parent: Consent
Id: iptp-consent
Title: "IPTp SMS Consent"
Description: "Records the patient's verbal consent to receive SMS reminders for the 
              IPTp-SP program. Consent is mandatory before enrollment is confirmed."

* status 1..1 MS
* status = #active

* scope 1..1 MS
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category 1..* MS
* category ^short = "Consent to receive SMS health reminders"

* patient 1..1 MS
* patient only Reference(IPTpPatient)

* dateTime 1..1 MS
* dateTime ^short = "Date and time consent was obtained"

* performer MS
* performer only Reference(IPTpPractitioner)
* performer ^short = "ANC provider who obtained consent"

* organization MS
* organization ^short = "Health facility where consent was obtained"

* policy MS
* policy.uri ^short = "Ministry of Health privacy and data policy URI"

* provision MS
* provision.type = #permit
* provision.action MS
* provision.action ^short = "Receive SMS reminders via shortcode 25332"

// ============================================================
// PROFILE 15: IPTp Eligibility Flag
// ============================================================

Profile: IPTpEligibilityFlag
Parent: Flag
Id: iptp-eligibility-flag
Title: "IPTp Eligibility Flag"
Description: "A flag indicating that a patient has been confirmed eligible for the 
              IPTp-SP program (gestational age 13–27 weeks at time of enrollment)."

* status 1..1 MS
* status = #active

* category 1..* MS
* category ^short = "IPTp eligibility"

* code 1..1 MS
* code = $iptp-cs#iptp-enrollment
* code ^short = "Eligibility confirmed: GA 13–27 weeks"

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* period 1..1 MS
* period.start 1..1 MS
* period.start ^short = "Date eligibility was confirmed"

* encounter MS
* encounter ^short = "ANC visit encounter at which eligibility was assessed"

* author MS
* author only Reference(IPTpPractitioner)

// ============================================================
// PROFILE 16: IPTp Care Plan
// ============================================================

Profile: IPTpCarePlan
Parent: CarePlan
Id: iptp-care-plan
Title: "IPTp Care Plan"
Description: "The overall care plan for an enrolled patient covering all planned IPTp-SP 
              doses, messaging schedule, and CHP follow-up integration."

* status 1..1 MS
* status = #active

* intent 1..1 MS
* intent = #plan

* title 1..1 MS
* title ^short = "IPTp-SP Malaria Prevention Care Plan"

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* period 1..1 MS
* period.start 1..1 MS
* period.start ^short = "Enrollment date"
* period.end MS
* period.end ^short = "Expected delivery date or program end"

* author MS
* author only Reference(IPTpPractitioner)

* careTeam MS
* careTeam ^short = "ANC provider and assigned CHP"

* addresses MS
* addresses only Reference(IPTpPregnancyCondition)

* activity 1..* MS
* activity.detail.kind MS
* activity.detail.kind = #ServiceRequest
* activity.detail.code MS
* activity.detail.code = $iptp-cs#iptp-dose-planned
* activity.detail.code ^short = "IPTp planned dose — use detail.sequence (1-4) and detail.description to label each dose"
* activity.detail.status MS
* activity.detail.scheduledTiming MS
* activity.detail.description MS
* activity.detail.description ^short = "e.g. 'IPTp Dose 1 (DOT at clinic)' or 'IPTp Dose 2 (self-admin, ≥28 days after Dose 1)'"

* note MS
* note ^short = "T-3 anchor used for all reminder scheduling"

// ============================================================
// PROFILE 17: IPTp Issue Report (Lost Medicine / Other)
// ============================================================

Profile: IPTpIssueReport
Parent: Observation
Id: iptp-issue-report
Title: "IPTp Issue Report"
Description: "Records a non-ADR issue reported by the patient via the Have-an-Issue SMS flow (Reply 3):
              lost medicine or another free-text concern. Side effects/ADRs are captured separately
              by IPTpADRObservation."

* extension contains
    IPTpResolutionStatus named resolutionStatus 0..1 MS and
    IPTpManualReviewFlag named manualReviewFlag 0..1 MS

* status 1..1 MS
* status = #final

* category 1..* MS
* category = $observation-category#survey
* category ^short = "Patient-reported issue via SMS reply 3 → option 2 (lost medicine) or 3 (other)"

* code 1..1 MS
* code from IPTpIssueTypeVS (required)
* code ^short = "issue-type-lost-medicine | issue-type-other"

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* effectiveDateTime 1..1 MS

* value[x] 0..1 MS
* valueString MS
* valueString ^short = "Free text concern (issue_text); required and encrypted at rest when code = issue-type-other"

* note MS
* note ^short = "Action: lost medicine → CHP advice/replacement; other → AWAITING_FREE_TEXT then auto-reply + manual review"

// ============================================================
// PROFILE 18: IPTp Program Feedback Observation
// ============================================================

Profile: IPTpFeedbackObservation
Parent: Observation
Id: iptp-feedback-observation
Title: "IPTp Program Feedback Observation"
Description: "Captures the patient's response to the feedback & gratitude survey sent 5 days after
              the final dose confirmation, plus any free-text improvement suggestion."

* status 1..1 MS
* status = #final

* category 1..* MS
* category = $observation-category#survey

* code 1..1 MS
* code = $iptp-cs#feedback-program-helpfulness

* subject 1..1 MS
* subject only Reference(IPTpPatient)

* effectiveDateTime 1..1 MS

* value[x] 1..1 MS
* valueBoolean MS
* valueBoolean ^short = "TRUE if patient replied 1 (Yes, reminders supported them); FALSE if replied 2 (No)"

* note MS
* note ^short = "Free-text improvement suggestion captured when valueBoolean = false"

// ============================================================
// PROFILE 19: IPTp Practitioner Role (Provider ↔ Facility binding)
// ============================================================

Profile: IPTpPractitionerRole
Parent: PractitionerRole
Id: iptp-practitioner-role
Title: "IPTp Practitioner Role"
Description: "Binds a whitelisted ANC provider to the health facility they are auto-bound to
              following HCW training (system principle: 'Facility auto bound and provider
              whitelist enforced')."

* practitioner 1..1 MS
* practitioner only Reference(IPTpPractitioner)

* organization MS
* organization only Reference(Organization)

* location 1..* MS
* location only Reference(IPTpFacility)

* code MS
* code ^short = "ANC provider role"

* active 1..1 MS
* active = true

// ============================================================
// INSTANCES (Examples)
// ============================================================

Instance: IPTpPatientExample
InstanceOf: IPTpPatient
Title: "Example IPTp Enrolled Patient"
Description: "An example of a pregnant woman enrolled in the IPTp-SP system"
Usage: #example

* id = "iptp-patient-001"
* active = true
* gender = #female
* telecom[phone].system = #phone
* telecom[phone].value = "0774232423"
* extension[ancNumberHash].valueString = "a3f1c2d4e5b6789012345678901234567890abcdef1234567890abcdef123456"
* extension[languagePreference].valueCodeableConcept = $iptp-cs#language-english "English"
* extension[smsConsent].valueBoolean = true
* communication[0].language = urn:ietf:bcp:47#en
* communication[0].preferred = true

Instance: IPTpEnrollmentExample
InstanceOf: IPTpEnrollment
Title: "Example IPTp Enrollment Episode"
Description: "An example enrollment episode for an IPTp patient"
Usage: #example

* id = "iptp-enrollment-001"
* status = #active
* patient = Reference(IPTpPatientExample)
* period.start = "2026-03-16"
* extension[messagingStatus].valueCodeableConcept = $iptp-cs#messaging-active "Messaging Active"
* extension[gestationalAgeBand].valueCodeableConcept = $iptp-cs#ga-early "Early GA Band"
* extension[chpFollowupFlag].valueBoolean = false
* type = $iptp-cs#iptp-enrollment "IPTp Enrollment"

Instance: IPTpDoseAdministrationExample
InstanceOf: IPTpDoseAdministration
Title: "Example IPTp Dose 1 Administration (DOT)"
Description: "First IPTp dose administered under Directly Observed Therapy at clinic"
Usage: #example

* id = "iptp-dose-001"
* status = #completed
* medicationReference = Reference(IPTpMedicationExample)
* subject = Reference(IPTpPatientExample)
* effectiveDateTime = "2026-03-16T10:00:00+03:00"
* extension[doseNumber].valuePositiveInt = 1
* extension[administrationMethod].valueCodeableConcept = $iptp-cs#iptp-dot "IPTp DOT"
* dosage.dose.value = 3
* dosage.dose.unit = "tablet"
* dosage.route = $snomed#26643006 "Oral route"
* dosage.text = "3 SP tablets taken together, swallowed whole"

Instance: IPTpMedicationExample
InstanceOf: IPTpMedication
Title: "Example SP Medication"
Description: "Sulfadoxine-Pyrimethamine medication instance"
Usage: #example

* id = "iptp-sp-medication"
* code = $snomed#372723002 "Sulfadoxine + pyrimethamine"
* status = #active
* form = $snomed#385055001 "Tablet"

Instance: IPTpT0ReminderExample
InstanceOf: IPTpSMSCommunication
Title: "Example T-0 SMS Reminder"
Description: "Dose day SMS reminder sent via short code 25332"
Usage: #example

* id = "iptp-sms-t0-001"
* status = #completed
* category = $iptp-cs#reminder-t0 "T-0 Reminder"
* subject = Reference(IPTpPatientExample)
* recipient[0] = Reference(IPTpPatientExample)
* sent = "2026-04-13T08:00:00+03:00"
* extension[reminderAnchor].valueCodeableConcept = $iptp-cs#reminder-t0 "T-0 Reminder"
* payload[0].contentString = "Today is your malaria prevention dose day. Take all 3 tablets together. Once you do, Reply: 1 Took it 2 Not yet 3 Have an issue. STOP to stop"
* language = #en

// ============================================================
// ADDITIONAL EXAMPLES — Practitioner / Facility / PractitionerRole
// ============================================================

Instance: IPTpPractitionerExample
InstanceOf: IPTpPractitioner
Title: "Example IPTp ANC Provider"
Description: "A whitelisted ANC health worker at the Shinyalu facility"
Usage: #example

* id = "iptp-practitioner-001"
* active = true
* identifier[0].system = "http://iptp.kemri.go.ke/fhir/identifier/staff-id"
* identifier[0].value = "SHIN-HCW-014"
* name[0].family = "Wanjiru"
* name[0].given[0] = "Grace"
* telecom[phone].system = #phone
* telecom[phone].value = "0712345678"
* extension[providerMSISDN].valueString = "0712345678"

Instance: IPTpFacilityExample
InstanceOf: IPTpFacility
Title: "Example IPTp Health Facility"
Description: "An ANC clinic in the Kakamega pilot (Shinyalu sub-county)"
Usage: #example

* id = "iptp-facility-001"
* name = "Shinyalu Sub-County Hospital"
* status = #active
* type.text = "ANC clinic / Sub-county hospital"
* address.district = "Shinyalu"
* address.state = "Kakamega"

Instance: IPTpPractitionerRoleExample
InstanceOf: IPTpPractitionerRole
Title: "Example Provider-Facility Binding"
Description: "Binds the ANC provider to their auto-bound facility after HCW training"
Usage: #example

* id = "iptp-practitioner-role-001"
* active = true
* practitioner = Reference(IPTpPractitionerExample)
* location[0] = Reference(IPTpFacilityExample)

// ============================================================
// ADDITIONAL EXAMPLES — Pregnancy / GA / Dose History
// ============================================================

Instance: IPTpPregnancyConditionExample
InstanceOf: IPTpPregnancyCondition
Title: "Example Active Pregnancy"
Description: "Confirmed active pregnancy at enrollment, GA 20 weeks"
Usage: #example

* id = "iptp-pregnancy-001"
* clinicalStatus = $condition-clinical#active
* code = $snomed#77386006 "Pregnant"
* subject = Reference(IPTpPatientExample)
* recordedDate = "2026-03-16"
* stage.summary.text = "20 weeks at enrollment (ga_band = EARLY)"

Instance: IPTpPregnancyConditionDeliveryExample
InstanceOf: IPTpPregnancyCondition
Title: "Example Pregnancy Condition - Delivery Outcome"
Description: "Pregnancy outcome logged as delivery; automatic STOP condition for messaging"
Usage: #example

* id = "iptp-pregnancy-002"
* extension[pregnancyOutcome].valueCodeableConcept = $iptp-cs#pregnancy-outcome-delivery "Delivery"
* clinicalStatus = $condition-clinical#resolved
* code = $snomed#77386006 "Pregnant"
* subject = Reference(IPTpPatientExample)
* recordedDate = "2026-09-10"
* stage.summary.text = "Delivered; IPTp-SP messaging stopped automatically"

Instance: IPTpGestationalAgeObservationExample
InstanceOf: IPTpGestationalAgeObservation
Title: "Example Gestational Age Observation"
Description: "GA captured at USSD Screen R3 - GA Entry"
Usage: #example

* id = "iptp-ga-obs-001"
* status = #final
* category = $observation-category#exam
* code = $loinc#11885-1
* subject = Reference(IPTpPatientExample)
* effectiveDateTime = "2026-03-16"
* valueQuantity.value = 20
* valueQuantity.unit = "weeks"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #wk
* note.text = "ga_band = EARLY (13-20)"

Instance: IPTpDoseHistoryObservationExample
InstanceOf: IPTpDoseHistoryObservation
Title: "Example Prior Dose History Observation"
Description: "Captured at USSD Screen R4 - IPTp History: patient had received 0 prior doses"
Usage: #example

* id = "iptp-dose-history-001"
* status = #final
* category = $observation-category#therapy
* code = $iptp-cs#iptp-enrollment "IPTp Enrollment"
* subject = Reference(IPTpPatientExample)
* effectiveDateTime = "2026-03-16"
* valueInteger = 0

// ============================================================
// ADDITIONAL EXAMPLES — Dose 2 (Self-Admin, Confirmed)
// ============================================================

Instance: IPTpDoseAdministrationSelfAdminExample
InstanceOf: IPTpDoseAdministration
Title: "Example IPTp Dose 2 Administration (Self-Admin, Confirmed)"
Description: "Second IPTp dose, self-administered at home and confirmed by SMS reply 1 (took it)"
Usage: #example

* id = "iptp-dose-002"
* status = #completed
* medicationReference = Reference(IPTpMedicationExample)
* subject = Reference(IPTpPatientExample)
* effectiveDateTime = "2026-04-13T09:15:00+03:00"
* extension[doseNumber].valuePositiveInt = 2
* extension[administrationMethod].valueCodeableConcept = $iptp-cs#iptp-self-admin "IPTp Self-Administration"
* extension[confirmationStatus].valueCodeableConcept = $iptp-cs#confirmation-confirmed "Dose Confirmed"
* extension[spacingValidFlag].valueBoolean = true
* dosage.dose.value = 3
* dosage.dose.unit = "tablet"
* dosage.route = $snomed#26643006 "Oral route"
* dosage.text = "3 SP tablets taken together, swallowed whole"
* note.text = "Confirmed via SMS reply 1; spacing valid (28 days since Dose 1)"

Instance: IPTpDoseScheduleExample
InstanceOf: IPTpDoseSchedule
Title: "Example Planned Dose 3"
Description: "The single future planned dose stored after Dose 2 is confirmed (only one future planned dose at a time)"
Usage: #example

* id = "iptp-dose-schedule-003"
* status = #active
* intent = #plan
* code = $iptp-cs#iptp-dose-planned "IPTp Dose Planned"
* extension[doseNumber].valuePositiveInt = 3
* subject = Reference(IPTpPatientExample)
* occurrenceDateTime = "2026-05-11"
* requester = Reference(IPTpPractitionerExample)
* locationReference = Reference(IPTpFacilityExample)
* note.text = "Dose spacing note: minimum 28 days from Dose 2 (2026-04-13)"

// ============================================================
// ADDITIONAL EXAMPLES — ADR / Issue Reports
// ============================================================

Instance: IPTpADRObservationMildExample
InstanceOf: IPTpADRObservation
Title: "Example Mild ADR"
Description: "Patient reported a mild side effect via SMS reply 3 → 1 (side effect) → 1 (mild)"
Usage: #example

* id = "iptp-adr-001"
* status = #final
* category = $observation-category#survey
* code = $snomed#281647001
* subject = Reference(IPTpPatientExample)
* effectiveDateTime = "2026-04-13T10:00:00+03:00"
* valueCodeableConcept = $iptp-cs#adr-mild "Mild ADR"
* component[symptomDescription].code = $loinc#75326-9 "Problem"
* component[symptomDescription].valueString = "Mild nausea"
* note.text = "Action: CHP advice given; added to dashboard metrics; InfoAFYA paused 48h; followup_flag auto-clears after 72h if no further reports"

Instance: IPTpADRObservationSevereExample
InstanceOf: IPTpADRObservation
Title: "Example Severe ADR"
Description: "Patient reported a severe side effect via SMS reply 3 → 1 (side effect) → 2 (severe)"
Usage: #example

* id = "iptp-adr-002"
* status = #final
* category = $observation-category#survey
* code = $snomed#281647001
* subject = Reference(IPTpPatientExample)
* effectiveDateTime = "2026-04-20T11:30:00+03:00"
* valueCodeableConcept = $iptp-cs#adr-severe "Severe ADR"
* component[symptomDescription].code = $loinc#75326-9 "Problem"
* component[symptomDescription].valueString = "Severe rash, swelling, and difficulty breathing"
* note.text = "Action: immediate facility referral; CHP urgent follow-up queue; facility alert; pharmacovigilance reporting queue; InfoAFYA blocked until resolved"

Instance: IPTpIssueReportLostMedicineExample
InstanceOf: IPTpIssueReport
Title: "Example Lost Medicine Issue Report"
Description: "Patient reported lost medicine via SMS reply 3 → 2 (lost medicine)"
Usage: #example

* id = "iptp-issue-001"
* status = #final
* category = $observation-category#survey
* code = $iptp-cs#issue-type-lost-medicine "Lost Medicine"
* subject = Reference(IPTpPatientExample)
* effectiveDateTime = "2026-04-13T10:05:00+03:00"
* extension[resolutionStatus].valueCodeableConcept = $iptp-cs#resolution-open "Open"
* note.text = "Referred to CHP for advice and replacement; followup_flag = TRUE"

Instance: IPTpIssueReportOtherExample
InstanceOf: IPTpIssueReport
Title: "Example Other (Free-Text) Issue Report"
Description: "Patient reported a free-text concern via SMS reply 3 → 3 (other)"
Usage: #example

* id = "iptp-issue-002"
* status = #final
* category = $observation-category#survey
* code = $iptp-cs#issue-type-other "Other Issue"
* subject = Reference(IPTpPatientExample)
* effectiveDateTime = "2026-04-20T12:00:00+03:00"
* valueString = "Nina wasiwasi kuhusu dawa hii, je ni salama wakati wa ujauzito?"
* extension[resolutionStatus].valueCodeableConcept = $iptp-cs#resolution-open "Open"
* extension[manualReviewFlag].valueBoolean = true
* note.text = "issue_text encrypted at rest; auto-reply sent; health worker may follow up"

// ============================================================
// ADDITIONAL EXAMPLES — CHP Follow-Up / Consent / Eligibility / Care Plan
// ============================================================

Instance: IPTpCHPFollowUpTaskExample
InstanceOf: IPTpCHPFollowUpTask
Title: "Example CHP Follow-Up Task"
Description: "Task created after 72h with no dose confirmation reply"
Usage: #example

* id = "iptp-chp-task-001"
* status = #requested
* intent = #order
* code = $iptp-cs#chp-followup "CHP Follow-up"
* description = "72-hour non-response to Dose 2 confirmation request"
* for = Reference(IPTpPatientExample)
* owner = Reference(IPTpPractitionerExample)
* authoredOn = "2026-04-16T08:00:00+03:00"
* restriction.period.start = "2026-04-16"

Instance: IPTpConsentExample
InstanceOf: IPTpConsent
Title: "Example SMS Consent"
Description: "Verbal consent obtained at USSD Screen R5 - Consent"
Usage: #example

* id = "iptp-consent-001"
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"
* category[0] = $iptp-cs#consent-sms "SMS Consent"
* patient = Reference(IPTpPatientExample)
* dateTime = "2026-03-16T09:50:00+03:00"
* performer[0] = Reference(IPTpPractitionerExample)
* policy[0].uri = "http://iptp.kemri.go.ke/fhir/consent-policy"
* provision.type = #permit
* provision.action[0] = $iptp-cs#consent-sms "SMS Consent"

Instance: IPTpEligibilityFlagExample
InstanceOf: IPTpEligibilityFlag
Title: "Example Eligibility Flag"
Description: "Eligibility confirmed at USSD Screen R1 (GA 13-27 weeks)"
Usage: #example

* id = "iptp-eligibility-001"
* status = #active
* category[0] = $iptp-cs#iptp-enrollment "IPTp Enrollment"
* code = $iptp-cs#iptp-enrollment "IPTp Enrollment"
* subject = Reference(IPTpPatientExample)
* period.start = "2026-03-16"
* author = Reference(IPTpPractitionerExample)

Instance: IPTpCarePlanExample
InstanceOf: IPTpCarePlan
Title: "Example IPTp Care Plan"
Description: "Overall care plan covering all four planned doses for the enrolled patient"
Usage: #example

* id = "iptp-careplan-001"
* status = #active
* intent = #plan
* title = "IPTp-SP Malaria Prevention Care Plan"
* subject = Reference(IPTpPatientExample)
* period.start = "2026-03-16"
* author = Reference(IPTpPractitionerExample)
* addresses[0] = Reference(IPTpPregnancyConditionExample)
* activity[0].detail.status = #completed
* activity[0].detail.description = "IPTp Dose 1 (DOT at clinic)"
* activity[0].detail.scheduledTiming.event[0] = "2026-03-16"
* activity[1].detail.status = #completed
* activity[1].detail.description = "IPTp Dose 2 (self-admin)"
* activity[1].detail.scheduledTiming.event[0] = "2026-04-13"
* activity[2].detail.status = #scheduled
* activity[2].detail.description = "IPTp Dose 3 (self-admin, ≥28 days after Dose 2)"
* activity[2].detail.scheduledTiming.event[0] = "2026-05-11"
* activity[3].detail.status = #scheduled
* activity[3].detail.description = "IPTp Dose 4 (self-admin, ≥28 days after Dose 3)"
* activity[3].detail.scheduledTiming.event[0] = "2026-06-08"

// ============================================================
// ADDITIONAL EXAMPLES — Program Feedback
// ============================================================

Instance: IPTpFeedbackYesExample
InstanceOf: IPTpFeedbackObservation
Title: "Example Feedback - Reminders Helped"
Description: "Patient replied 1 (Yes) to the feedback survey"
Usage: #example

* id = "iptp-feedback-001"
* status = #final
* category = $observation-category#survey
* code = $iptp-cs#feedback-program-helpfulness "IPTp Reminder Program Helpfulness"
* subject = Reference(IPTpPatientExample)
* effectiveDateTime = "2026-06-13T09:00:00+03:00"
* valueBoolean = true

Instance: IPTpFeedbackNoExample
InstanceOf: IPTpFeedbackObservation
Title: "Example Feedback - Reminders Did Not Help"
Description: "Patient replied 2 (No) to the feedback survey and offered a suggestion"
Usage: #example

* id = "iptp-feedback-002"
* status = #final
* category = $observation-category#survey
* code = $iptp-cs#feedback-program-helpfulness "IPTp Reminder Program Helpfulness"
* subject = Reference(IPTpPatientExample)
* effectiveDateTime = "2026-06-13T09:05:00+03:00"
* valueBoolean = false
* note.text = "Suggestion: send reminders a day earlier so I have time to buy airtime to reply"

// ============================================================
// SEARCH PARAMETER — Duplicate enrollment lookup by ANC number hash
// ============================================================

Instance: IPTpANCNumberHashSearchParameter
InstanceOf: SearchParameter
Title: "Search by IPTp ANC Number Hash"
Description: "Enables R5 - ANC NUMBER duplicate-enrollment lookup: search Patient by the hashed
              ANC number captured at USSD enrollment, without exposing the raw ANC number."
Usage: #definition

* id = "iptp-anc-number-hash"
* url = "http://iptp.kemri.go.ke/fhir/SearchParameter/iptp-anc-number-hash"
* name = "ANCNumberHash"
* status = #active
* description = "Search Patient resources by hashed ANC number to detect duplicate/STOPPED enrollments before creating a new IPTpEnrollment."
* code = #anc-number-hash
* base = #Patient
* type = #string
* expression = "Patient.extension('http://iptp.kemri.go.ke/fhir/StructureDefinition/iptp-anc-number-hash').value"
