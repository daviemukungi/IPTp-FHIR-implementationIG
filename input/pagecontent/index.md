# IPTp-SP Digital Support System

This Implementation Guide describes the FHIR data model for the **IPTp-SP Digital Support
System**, piloted in Kakamega County, Kenya (Shinyalu & Ikolomani sub-counties). The system
digitally supports Intermittent Preventive Treatment of malaria in Pregnancy with
Sulfadoxine-Pyrimethamine (IPTp-SP).

### Scope

* **ANC provider enrollment (USSD)** — a whitelisted, facility-bound ANC health worker enrolls
  an eligible pregnant woman (gestational age 13–27 weeks) using a USSD tool: eligibility,
  phone number, gestational age, prior IPTp dose count, hashed ANC number (duplicate-enrollment
  check), SMS consent, and language preference.
* **Dosing** — the first dose is always given under Directly Observed Therapy (DOT) at the
  clinic; subsequent doses are self-administered at home, at least 28 days apart, with only one
  future planned dose stored at a time.
* **SMS support** — a dedicated short code (25332, interactive) drives dose reminders
  (T-3/T-0), a confirmation engine (24h/72h nudges), adverse drug reaction and issue reporting,
  STOP handling, and a feedback survey. The InfoAFYA sender ID delivers one-way behavioural
  support messages (trust, autonomy, norm reinforcement, identity reinforcement, reassurance,
  completion, ANC continuity).
* **CHP follow-up** — non-response after 72 hours, lost medicine, or a severe adverse reaction
  triggers a Community Health Promoter follow-up task.

### Key profiles

Patient, Practitioner, PractitionerRole, Location (Facility), EpisodeOfCare (Enrollment),
Condition (Pregnancy), Observation (gestational age, prior dose history, ADR, issue report,
program feedback), MedicationAdministration (dose administration), ServiceRequest (planned
dose), CarePlan, Communication (SMS), Consent, Flag (eligibility), and Task (CHP follow-up).

See the [Artifacts](artifacts.html) page for the full list of profiles, extensions, value sets,
and examples.