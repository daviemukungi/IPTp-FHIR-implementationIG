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
Alias: $iptp-cs = http://iptp.kemri.go.ke/fhir/CodeSystem

// ============================================================
// CODE SYSTEMS
// ============================================================

CodeSystem: IPTpCodeSystem
Id: iptp-code-system
Title: "IPTp-SP Code System"
Description: "Code system for IPTp-SP Digital Support System concepts"
* ^url = "http://iptp.kemri.go.ke/fhir/CodeSystem"
* ^status = #active
* ^caseSensitive = true
* #iptp-enrollment       "IPTp Enrollment"           "Registration of a pregnant woman into the IPTp-SP program"
* #iptp-dose-confirmed   "IPTp Dose Confirmed"        "A confirmed IPTp-SP dose taken by the patient"
* #iptp-dose-planned     "IPTp Dose Planned"          "A future planned IPTp-SP dose"
* #iptp-dose-missed      "IPTp Dose Missed"           "A missed IPTp-SP dose"
* #iptp-dot              "IPTp DOT"                   "Directly Observed Therapy dose administered at clinic"
* #iptp-self-admin       "IPTp Self-Administration"   "Self-administered IPTp dose at home"
* #consent-sms           "SMS Consent"                "Consent to receive SMS reminders"
* #language-english      "English"                    "Patient prefers English language messages"
* #language-kiswahili    "Kiswahili"                  "Patient prefers Kiswahili language messages"
* #ga-early              "Early GA Band"              "Gestational age 13–20 weeks"
* #ga-mid                "Mid GA Band"                "Gestational age 21–27 weeks"
* #adr-mild              "Mild ADR"                   "Mild adverse drug reaction"
* #adr-severe            "Severe ADR"                 "Severe adverse drug reaction requiring immediate care"
* #stop-requested        "STOP Requested"             "Patient has opted out of SMS reminders"
* #chp-followup          "CHP Follow-up"              "Community Health Promoter follow-up triggered"
* #reminder-t3           "T-3 Reminder"               "Reminder sent 3 days before dose date"
* #reminder-t0           "T-0 Reminder"               "Reminder sent on dose day"
* #reminder-24h          "24h Nudge"                  "24-hour follow-up nudge"
* #reminder-72h          "72h Escalation"             "72-hour escalation to CHP queue"

// ============================================================
// VALUE SETS
// ============================================================

ValueSet: IPTpDoseStatusVS
Id: iptp-dose-status-vs
Title: "IPTp Dose Status Value Set"
Description: "Status codes for IPTp-SP doses"
* $iptp-cs#iptp-dose-confirmed
* $iptp-cs#iptp-dose-planned
* $iptp-cs#iptp-dose-missed
* $iptp-cs#iptp-dot
* $iptp-cs#iptp-self-admin

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
* value[x] only code
* valueCode from http://hl7.org/fhir/ValueSet/request-status (required)

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
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* value[x] only positiveInt

Extension: IPTpAdministrationMethod
Id: iptp-administration-method
Title: "IPTp Administration Method"
Description: "Whether the dose was DOT (clinic) or self-administered (home)"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* value[x] only CodeableConcept
* valueCodeableConcept from IPTpDoseStatusVS (extensible)

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

* clinicalStatus 1..1 MS
* clinicalStatus = $condition-clinical#active

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
* code = $loinc#11885-1 "Gestational age Estimated"

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
    IPTpAdministrationMethod named administrationMethod 1..1 MS

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
* category ^short = "reminder | instruction | alert | notification"

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
* code = $snomed#281647001 "Adverse drug reaction"

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
* activity ^slicing.discriminator.type = #pattern
* activity ^slicing.discriminator.path = "detail.kind"
* activity ^slicing.rules = #open

* activity contains
    dose1 0..1 MS and
    dose2 0..1 MS and
    dose3 0..1 MS and
    dose4 0..1 MS

* activity[dose1].detail.kind = #ServiceRequest
* activity[dose1].detail.code = $iptp-cs#iptp-dose-planned
* activity[dose1].detail.status MS
* activity[dose1].detail.scheduledTiming MS
* activity[dose1].detail.description ^short = "IPTp Dose 1 (DOT at clinic)"

* activity[dose2].detail.kind = #ServiceRequest
* activity[dose2].detail.code = $iptp-cs#iptp-dose-planned
* activity[dose2].detail.status MS
* activity[dose2].detail.scheduledTiming MS
* activity[dose2].detail.description ^short = "IPTp Dose 2 (self-admin, ≥28 days after dose 1)"

* activity[dose3].detail.kind = #ServiceRequest
* activity[dose3].detail.code = $iptp-cs#iptp-dose-planned
* activity[dose3].detail.status MS
* activity[dose3].detail.scheduledTiming MS
* activity[dose3].detail.description ^short = "IPTp Dose 3 (self-admin, ≥28 days after dose 2)"

* activity[dose4].detail.kind = #ServiceRequest
* activity[dose4].detail.code = $iptp-cs#iptp-dose-planned
* activity[dose4].detail.status MS
* activity[dose4].detail.scheduledTiming MS
* activity[dose4].detail.description ^short = "IPTp Dose 4 (self-admin, ≥28 days after dose 3)"

* note MS
* note ^short = "T-3 anchor used for all reminder scheduling"

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
* extension[messagingStatus].valueCode = #active
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
