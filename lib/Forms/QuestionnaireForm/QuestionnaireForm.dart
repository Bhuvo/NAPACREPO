import 'package:npac/Forms/FormI/Widget/YesNo.dart';
import 'package:npac/app/export.dart';

class QuestionnaireForm extends StatefulWidget {
  const QuestionnaireForm({super.key});
  
  @override
  State<QuestionnaireForm> createState() => _QuestionnaireFormState();
}

class _QuestionnaireFormState extends State<QuestionnaireForm> {
  bool isDifferentCampus = false;
  bool isadministrativeSystemOther = false;
  bool isCoYes =false;
  bool isOPDconducted  = false;
  bool isTimingOthers = false;
  bool isRolesperformed = false;
  bool isECG = false;
  bool isEchocardiogram = false;
  bool isCatheterisation = false;
  bool isCatheterisationOther = false;
  bool isDeliveryConductedOther = false;
  bool isCounselling = false;
  bool deliveryPlanfive = false;


  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: SafeArea(
        child: MFormBody(Childrens: [
          MText(text: 'Process of Care / Practice Pattern Questionnaire',fontSize: 16,),
          Space(),
          MText(text: 'I. Site Details'),
          Space(),
          MrowTextTextFieldWidget(title: '1. Name of the participating site:',isneedDivider: false,onChanged: (val){},),
          MrowTextTextFieldWidget(title: '2. Name of the person filling the form (upto 4 responses)',isneedDivider: false,onChanged: (val){},),
          MrowTextTextFieldWidget(title: '3. Department:',isneedDivider: false,onChanged: (val){},),
          MrowTextTextFieldWidget(title: '4. Designation: ',onChanged: (val){},),
          MText(text: 'II. Departments- Location, Structure and Functioning'),
          Space(),
          MRowTextRadioWidget(title: '1. Where are the Cardiology and OBG services offered in your institution?',options: List_items.CardiologyAndOBGServices,isneedDivider: false,onChanged: (val){
            if(val=='different campus'){
              setState(() {
                isDifferentCampus = true;
              });
            }else{
              setState(() {
                isDifferentCampus = false;
              });
            }
          },),
          isDifferentCampus ? MTextField(label: 'If different campus,mention the distance between them (KM):',onChanged: (val){},) : Container(),
          MDivider(),
          MRowTextRadioWidget(title: '2. How is the administrative system in your institution?',options: List_items.administrativeSystem,isneedDivider: false,onChanged: (val){
            if(val=='Others'){
              setState(() {
                isadministrativeSystemOther = true;
              });
            }else{
              setState(() {
                isadministrativeSystemOther = false;
              });
            }
          },),
          isadministrativeSystemOther ? MTextField(label: 'Any other, Explain',onChanged: (val){},) : Container(),
          MDivider(),
          MSmallText(text: '3. Cardio-Obstetric(CO) OPD',),
          Space(),
          MRowTextRadioWidget(title: 'a. Is there a separate OPD conducted for Cardio-Obstetric patients',onChanged: (val){
            if(val=='Yes'){
              setState(() {
                isCoYes = true;
              });
            }else{
              setState(() {
                isCoYes = false;
              });
            }
          },isneedDivider: false,),
          isCoYes ? Column(
            children: [
              MRowTextRadioWidget(title: 'b. Where is the CO OPD conducted',options: ['Obstetrics Department','Cardiology Department','Others'],onChanged: (val){
                if(val=='Others'){
                  setState(() {
                    isOPDconducted = true;
                  });
                }else{
                  setState(() {
                    isOPDconducted = false;
                  });
                }
              },isneedDivider: false,),
              isOPDconducted ? MTextField(label: 'If other, Explain',onChanged: (val){},) : Container(),
              MRowTextCheckBox(title: 'c. Who are the faculty available in the CO OPD ',isneedDivider: false,result: (val){},list: ['Cardiologist','Obstetrician','Anaesthetist','. Cardiac surgeon','MFM consultants'],)

            ],
          ): Container(),
          MDivider(),
          MSmallText(text: '4. Where is the pregnant woman with heart disease admitted in case of a cardiac problem?',),
          Space(),
          MRowTextCheckBox(title: '1st Trimester',result: (val){},list: ['Obstetrics','Cardiology'],isneedDivider: false,),
          MRowTextCheckBox(title: '2nd Trimester',result: (val){},list: ['Obstetrics','Cardiology'],isneedDivider: false,),
          MRowTextCheckBox(title: '3rd Trimester',result: (val){},list: ['Obstetrics','Cardiology'],isneedDivider: false,),
          MDivider(),
          MRowTextRadioWidget(title: '5. Do you have round-the-clock cardiology services available in your institution ',onChanged: (val){}),
          MRowTextRadioWidget( onChanged: (val){
            if(val=='Others'){
              setState(() {
                isTimingOthers = true;
              });
            }else{ setState(() {
              isTimingOthers = false;
            });}
          },isneedDivider: false,options: ['All days','Weekdays only','Others'] ,title: '6. If cardiology services are not round the clock, what is the working pattern of the cardiology department?',),
          isTimingOthers ? MTextField(label: 'If other, Mention Working time from & to',onChanged: (val){},) : Container(),
          MDivider(),
          MRowTextRadioWidget(options: List_items.rolesperformed,onChanged: (val){},title: '7. What are the roles performed by a cardiology team member while visiting the OBG department?',),
          MRowTextRadioWidget(options: List_items.rolesperformed,isneedDivider: false,onChanged: (val){
            if(val=='Others'){
              setState(() {
                isRolesperformed = true;
              });
            }else{ setState(() {
              isRolesperformed = false;
            });}
          },title: '8. What is the system of intimation of PWWHD admitted under OBG with thecardiology team and vice versa?',),
          isRolesperformed ? MTextField(label: 'If other, Mention',onChanged: (val){},) : Container(),
          MDivider(),
          MText(text: 'III. Infrastructure, investigations and scope ofservices:',fontSize: 16,),
          Space(),
          MSmallText(text: '9. ECG',),
          Space(),
          MRowTextRadioWidget(title: 'a. Does your institution have an ECG machine?',onChanged: (val){},isneedDivider: false,),
          MRowTextCheckBox(result: (val){
            if(val.contains('Others')){
              setState(() {
                isECG = true;
              });
            }else{setState(() {
              isECG = false;
            });}
          },list: ['Cardiology department','OBG department','Dedicated ECG room in a common area','Others'],title: 'b. ECG machines are available in the following places in your institution',isneedDivider: false,),
          isECG ? MTextField(label: 'If other, specify',onChanged: (val){},) : Container(),
          MDivider(),
          MSmallText(text: '10. Echocardiogram',),
          Space(),
          MRowTextRadioWidget(title: 'a. Does your institution have an Echocardiography machine?',isneedDivider: false,onChanged: (val){},),
          MRowTextRadioWidget(options: ['Cardiology department, Echo room','Cardiology department, Echo room','OBG department, ICU','Cardiology department, ICU'],title: 'b. Where are the echocardiography machines located in your institution',isneedDivider: false,onChanged: (val){},),
          MRowTextRadioWidget(options: ['Same day, Echo room','Another day by appointment','Others'],title: 'c. . How long is the waiting period for a PWWHD to have an echocardiogram in the cardiology department',isneedDivider: false,onChanged: (val){
            if(val=='Others'){
              setState(() {
                isEchocardiogram = true;
              });
            }else{
              setState(() {
                isEchocardiogram = false;
              });
            }
          },),
          isEchocardiogram? MTextField(label: 'If other, specify',onChanged: (val){},) : Container(),
          MRowTextRadioWidget(title: 'd. Who performs the first level/basic echo in your institution',onChanged: (val){},isneedDivider: false,options: List_items.basicEco,),
          MRowTextRadioWidget(title: 'e. Is a stress echocardiogram done routinely in your institute?',onChanged: (val){},isneedDivider: false,options: ['Yes','No','Facility not available'],),
          MDivider(),
          MSmallText(text: '11. Cardiac Catheterisation laboratory',),
          Space(),
          MRowTextRadioWidget(title: 'a. Does your institution have a cardiac catheterisation laboratory',onChanged: (val){
            if(val=='Yes'){
              setState(() {
                isCatheterisation = true;
              });
            }else{
              setState(() {
                isCatheterisation = false;
              });
            }
          },isneedDivider: false,),
          isCatheterisation? Column(children: [
            MRowTextRadioWidget(title: 'b. Timing of cardiac cath lab?',onChanged: (val){},isneedDivider: false,options:['Round the clock','Office hours'],),
            MRowTextRadioWidget(title: 'c. What are the antenatal cardiac interventions performed in your catheterisation lab?',onChanged: (val){
              if(val=='Others'){
                setState(() {
                  isCatheterisationOther = true;
                });
              }else{
                setState(() {
                  isCatheterisationOther = false;
                });
              }
            },isneedDivider: false,options:['Balloon valvotomies(BMV/BPV/BAV)','EP Studies RF ablations','Others','AN interventions not done in our institution'],),
            isCatheterisationOther? MTextField(label: 'If other, specify',onChanged: (val){},) : Container(),
          ],):Container(),
          MSmallText(text: '12. Cardiac Surgery',),
          Space(),
          YesNo(onDoseChanged: (val){},title: 'a. Do you have CT surgeon services available in our institution / attached hospitals?',
            widget:Column(children: [
              MRowTextCheckBox(title: 'b. Procedures the CTVS team performs',result: (val){},isneedDivider: false,list: ['Routine cardiac surgeries','Valve replacements','Thoracic aortic surgeries'],),
              MRowTextCheckBox(title: 'c. Surgeries on pregnant women',result: (val){},isneedDivider: false,list: ['Cardiac surgeries done during the antenatal period','Cardiac surgeries and LSCS are done in the same sitting','Cardiac surgeries done during the postpartum period','Cardiac surgeries are not done during pregnancy/postpartum'],),
            ],)
            ,),
          MDivider(),
          MSmallText(text: '13. Labour Room(LR)/Operation Room(OR)/Intensive Care Unit(ICU) care',),
          Space(),
          MRowTextRadioWidget(title: 'b. Is there a high-risk LR facility in your institution?',onChanged: (val){},isneedDivider: false,),
          MRowTextRadioWidget(onChanged: (val){},title: 'c. Doesthe obstetric unit of your institution have an intensive care facility?', isneedDivider: false,options: ['High Dependency Unit','Hybrid ICU','Obstetric ICU','NICU','ICU facility not available in Obstetrics Department','No ICU facility is available'],),
          MRowTextRadioWidget(title: 'd. Where is delivery conducted for cardiac patients?',options: ['Obstetric ICU','Labour Room','Others'],onChanged: (val){
            if(val=='Others'){
              setState(() {
                isDeliveryConductedOther = true;
              });
            }else{
              setState(() {
                isDeliveryConductedOther = false;
              });
            }
          },isneedDivider: false,),
          YesNo(isneedDivider: false,title: 'e. Following labour analgesia facilities are available in your institution',options: ['Epidural','PCA pump','Entonox','Others','Labour analgesia facility not available'],
            widget:MTextField(label: 'If other, specify',onChanged: (val){},) ,),
          MRowTextRadioWidget(title: 'f. Is anaesthetist available in your labour room',options: ['Yes always','Available on call','Not available'],isneedDivider: false,onChanged: (val){},),
          MRowTextRadioWidget(title: 'g. Is cardiac anaesthetist available in your institution',isneedDivider: false,onChanged: (val){}),
          MSmallText(text: '14. Other equipment /investigations',),
          Space(),
          YesNo(title: 'a. Available equipment in the labour room',options: ['Multipara monitors','Infusion pumps','Hydraulic delivery cot(for backrest)','Oxygen (Cylinders / central supply)','Ventilator','Others'],isneedDivider: false,
            widget:MTextField(label: 'If other, specify',onChanged: (val){},),),
          YesNo(title: 'b. Available equipment in the Operating Room',options: ['Ventilator','Defibrillator','Functioning OT table','Anaesthesia work station','Others'],isneedDivider: false,
            widget:MTextField(label: 'If other, specify',onChanged: (val){},),),
          YesNo(title: 'c. Cardiac specific blood investigations available in your institution?',options: ['nT pro-BNP','Troponin','PT INR','D-dimer','Others'],isneedDivider: false,
            widget:MTextField(label: 'If other, specify',onChanged: (val){},),),
          YesNo(title: 'd. Other imaging modalities available in your institution?',options: ['Cardiac MR','Cardiac CT','Others'],isneedDivider: false,
            widget:MTextField(label: 'If other, specify',onChanged: (val){},),),
          MDivider(),
          MText(text: 'IV. Expenditure and cost of treatment',fontSize: 16,),
          Space(),
          YesNo(title: '15. How do pregnant women pay for the care process(including echo) in your institute?',options: ['Free treatment under government schemes','Subsidised costs provided by the institution','Regular cost to the institution','Others'],
            widget:MTextField(label: 'If other, specify',onChanged: (val){},),),
          YesNo(title: '16. How do pregnant women procure drugs?',options: ['Free medications provided in the hospital by the State Government','Free medications provided in the hospital by Central Government','Free medications provided in the hospital by NGO / Private institutions','Subsidised costs provided by institutions','Subsidised cost provided by Jan Aushadi Kendra outside','From private pharmacy','Others'],
            widget:MTextField(label: 'If other, specify',onChanged: (val){},),),
          MText(text: 'V. Referral and receiving process',),
          Space(),
          MRowTextCheckBox(title: '17. What kind of patients are delivered in your institute? ',result: (val){},list: ['Booked patients in same center','Booked patients registered in any other maternal care center','Unbooked walk-in patients','Referred patientsfrom other centers'],),
          MRowTextRadioWidget(title: '18. Where do you get referred patients from',options: ['Other departments of your institutions(cardiology/CTVS/others)','Government hospitals / Sub-centers / PHCs','Other private hospitals'],),
          MRowTextRadioWidget(title: '19. Do you refer patient from your institution to another facility for CO care?',onChanged: (val){},),
          MRowTextRadioWidget(title: '20. Reasonsfor referral from your centre',options: ['Non-availability of 24/7 cardiology services','Non availability of bed','Non availability of Interventional cardiac procedures','No / limited CO team is available','Patient choice'],),
          MText(text: 'VI. Preconception counselling(PCC)',fontSize: 16,),
          Space(),
          MRowTextRadioWidget(title: '21. Do you offer preconception counselling in your institution?',options: ['Yes, in dedicated preconception clinic','Yes, in the Antenatal clinic / OPD','Patients generally don’t come for PCC'],onChanged: (val){},),
          YesNo(title: '22. If yes where is the Cardiac preconception clinic located',widget: MTextField(label: 'If other, specify',onChanged: (val){},),options: ['Obstetric department','Cardiology department','Cardio-obstetric OP department','Common OP department','Others'],),
          YesNo(title: '23. Who does the Cardiac Preconception clinic cater to?',widget: MTextField(label: 'If other, specify',onChanged: (val){},),options: ['Follow-up cardiac patients detected during any school/ adolescent program','Patientsreferred from CTVS/cardio department','Patients from other clinics/departments in your institution','Others'],),
          MRowTextCheckBox(result: (val){
            if(val == 'Others'){
              setState(() {
                isCounselling = true;
              });
            }else{
              setState(() {
                isCounselling = false;
              });
            }
          },title: '24. Who offers cardiac preconception counselling?',isneedDivider: false,list: ['Obstetrician','Cardiologist','Cardiac surgeon','Anaesthetist','Others'],),
          isCounselling ? MTextField(label: 'If other, specify',onChanged: (val){},): Container(),
          MDivider(),
          MRowTextRadioWidget(title: '25. How isthe correction of lesions/optimisation of medication planned during PCP?', onChanged: (val){},options: ['Decided by cardiac surgeon','Decided by cardiologist','Decided by obstetrician','Combined discussion cardiologist/OBG/CTVS'],),
          MSmallText(text: 'VII. Screening, evaluation and diagnosis of disease',),
          Space(),
          YesNo(title: '26. What is the screening process to look for heart disease among antenatal mothers in your institution',options: List_items.screeningprocess,
            widget:MTextField(label: 'If other, specify',onChanged: (val){},),),
          MRowTextRadioWidget(title: '27. Screening ECG is done for',options: ['All antenatal mothers presenting for cardiac evaluation','For antenatal mothers suspected to have heart disease','For antenatal mothers with known heart disease only'],),
          MRowTextRadioWidget(title: '28. Screening Echo is done for',options: ['All antenatal mothers presenting for cardiac evaluation','For antenatal mothers suspected to have heart disease','For antenatal mothers with known heart disease only'],),
          MrowTextTextFieldWidget(title: '29. If routine screening echo is done for AN mothers in your institution, at what gestational age it is done? (Weeks)',onChanged: (val){},type: MInputType.numeric,),
          YesNo(title: '30. When is echocardiogram done, once HD is suspected for an outpatient',options: ['Immediate echo evaluation is possible','Waiting period for an echocardiogram > 2 days','Others'],
          widget: MTextField(label: 'If other, specify',onChanged: (val){},),),
          YesNo(title: '31. When is echocardiogram done, once HD is suspected for an inpatient',options: ['Immediate echo evaluation is possible','Waiting period for an echocardiogram > 2 days','Others'],
            widget: MTextField(label: 'If other, specify',onChanged: (val){},),),
          YesNo(title: '32. How is the patient triaged as in your institution once HD is identified?',options: ['Not triaged','Symptom wise by NYHA','According to mWHO risk class','Others'],
            widget: MTextField(label: 'Any other triaging methods used, specify',onChanged: (val){},),),
          MText(text: 'VIII. Pre-conception Contraception',fontSize: 16,),
          Space(),
          MRowTextRadioWidget(title: '33. Is preconception contraception a part of Preconception counseling in your center?',options: ['Yes','Yes, not in detail','Yes, rarely','No','Does not apply as we don’t have regular PCC sessions'],),
          MRowTextRadioWidget(title: '34. Is contraception methods advised to nullipara if encountered with high-risk cardiac lesion',onChanged: (val){},),
          MText(text: 'IX. Medical Termination of Pregnancy',fontSize: 16,),
          Space(),
          MRowTextCheckBox(title: '35. Who takes the decision for MTP in a PWWHD in discussion with patient',list: ['Obstetrician','Cardiologist','CTVS','Anaesthetist','Medical team decision'],),
          MRowTextRadioWidget(title: '36. Do you offer contraceptive advice after a MTP',onChanged: (val){},options: ['Always','Sometimes','No'],),
          MText(text: 'X. Antenatal care- management and follow-up',fontSize: 16,),
          Space(),
          MSmallText(text: '37. Antenatal Visit Evaluation',),
          Space(),
          YesNo(title: 'a. What risk scores are used in antenatal mothers with heart disease',options: ['mWHO','CARPREG 1','CARPREG 2','ZAHARA','Others','None'],
          widget: MTextField(label: 'If other, specify',onChanged: (val){},),isneedDivider: false,),
          YesNo(title: 'b. Who are the specialists who evaluate a PWWHD on the first evaluation?',options: ['Obstetrician','Cardiologist','CTVS','Anaesthetist','MFM/internal medicine','Others'],
            widget: MTextField(label: 'If other, specify',onChanged: (val){},),isneedDivider: false,),
          YesNo(title: 'c. How is the frequently ofsubsequent visits planned for a patient with > mWHO II HD',options: ['As suggested for the mWHO classes by ESC / ACOG GL','Institutional protocol','Individualised as per patient','Others'],
            widget: MTextField(label: 'If other, specify',onChanged: (val){},),isneedDivider: false,),
          MRowTextRadioWidget(title: 'd. What are the components of the subsequent visits of a High-Risk patient( > mWHO II)',onChanged: (val){},isneedDivider: false,options: ['Clinical examination','ECG','ECHO','All of the above','Individualised'],),
          YesNo(title: 'e. How are the subsequent visits planned- Low-Risk patient( ≤ m WHO II) frequency of subsequent visit',options: ['As suggested for the mWHO classes by ESC / ACOG GL','Institutional protocol','Individualised as per patient','Others'],
            widget: MTextField(label: 'If other, specify',onChanged: (val){},),isneedDivider: false,),
          MRowTextRadioWidget(title: 'f. How are the subsequent visits planned- low-Risk patient( ≤ m WHO II) components of subsequent visit',onChanged: (val){},isneedDivider: false,options: ['Clinical examination','ECG','ECHO','All of the above'],),
          MSmallText(text: '38. Antenatal Interventions',),
          YesNo(title: 'a. Who decides the need for antenatal cardiac interventions?',options: ['Obstetrician','Cardiologist','CTVS','Anaesthetist','Combined discussion','Others'],isneedDivider: false,
          widget: MTextField(label: 'If other, specify',onChanged: (val){},),),
          YesNo(title: 'b. Following team members are present during antenatal cardiac procedure in the catheterisation lab in addition to the cardiologist?.',options: ['Obstetrician','CTVS','Anaesthetist','Neonatologist / paediatrician','Others'],isneedDivider: false,
            widget: MTextField(label: 'If other, specify',onChanged: (val){},),),
          MRowTextRadioWidget(title: 'c. At what gestational age elective AN cardiac interventions are performed at your institution?',options: ['18 -20 weeks','21-24 weeks','25-28 weeks','29-32 weeks','> 32 weeks'],),
          MText(text: 'XI. Peripartum Protocolsfor Management of PWWHD',fontSize: 16,),
          Space(),
          MSmallText(text: '39. Management Protocol of PWWHD',),
          Space(),
          YesNo(title: 'a. Do you have a common institutional protocol for the care of pregnant women with heart disease?',isneedDivider: false, options: ['Yes','No, it varies according to the clinician\'s preference'],
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MSmallText(text: 'b.Do you have lesionspecific protocols for',),
              Space(),
              MRowTextRadioWidget(title: 'Prosthetic valve',onChanged: (val){},isneedDivider: false,),
              MRowTextRadioWidget(title: 'Cardio myopathies/Heart failure',onChanged: (val){},isneedDivider: false,),
              MRowTextRadioWidget(title: 'Valvular Heart Disease',onChanged: (val){},isneedDivider: false,),
              MRowTextRadioWidget(title: 'Congenital Heart Disease',onChanged: (val){},isneedDivider: false,),
              MRowTextRadioWidget(title: 'Pulmonary HTN',onChanged: (val){},isneedDivider: false,),
              MRowTextRadioWidget(title: 'Arrythmias',onChanged: (val){},isneedDivider: false,),
              MRowTextRadioWidget(title: 'Aortopathies',onChanged: (val){},isneedDivider: false,),
            ],
          ),),
          MRowTextRadioWidget(title: 'c. What are the kind of HD are given prophylactic antibiotic therapy during termination of pregnancy.',isneedDivider: false,onChanged: (val){},options: List_items.antibioticTherapy,),
          MSmallText(text: 'd. What are the situations, when you use prophylactic antibioticsfor PWWHD in your institution.',),
          Space(),
          MRowTextCheckBox(title: 'LSCS',isneedDivider: false,list: ['Before','After'],result: (val){},),
          MRowTextCheckBox(title: 'NVD / AVD',isneedDivider: false,list: ['Before','After'],result: (val){},),
          MRowTextCheckBox(title: 'MTP',isneedDivider: false,list: ['Before','After'],result: (val){},),
          MRowTextRadioWidget(title: 'e. How do you give prophylactic antibiotic therapy during termination of pregnancy',onChanged: (val){},isneedDivider: false,options: ['Single dose before delivery','Two doses before and after delivery','Start before and continue for three days after delivery','Start before and continue for five days after delivery'],),
          YesNo(title: 'f. What are the common antibiotics used for prophylaxis',options: List_items.commonAntibiotics,isneedDivider: false,
            widget: MTextField(label: 'If other, specify',onChanged: (val){},),),
          MDivider(),
          MSmallText(text: '40. Admission and Hospitalisation protocol',),
          MRowTextRadioWidget(title: '1. What kind of cardiac patients do you admit electively ahead of delivery date for safe confinement',isneedDivider: false,options: ['All cardiac patients','High-risk cardiac patients','No one is admitted electively'],onChanged: (val){},),
          YesNo(title: '2. At what gestational age, do you admit high-risk cardiac patientsforsafe confinement', options: ['28-36 weeks','36-40 weeks','Others'],isneedDivider: false,
          widget: MTextField(label: 'If other, specify',onChanged: (val){},),),
          MRowTextRadioWidget(title: '3. Under whose care are cardiac patients admitted for safe confinement',options: ['Obstetrician','Cardiologist','Combined admission'],onChanged: (val){},),
          MSmallText(text: '3. Delivery Plan protocols',),
          Space(),
          MRowTextRadioWidget(title: 'a. Do you formulate a written delivery plan for every PWWHD?',isneedDivider: false,onChanged: (val){},options: ['Yes, formulated in the First trimester','Yes, formulated in the second trimester','Yes, formulated in the Third trimester','Yes, after admission forsafe confinement','No'],),
          MRowTextRadioWidget(
            title: 'b. Who are all involved in the formulation of the delivery plan?',initialValue: deliveryPlanfive ? 'Does not apply' : null,onChanged: (val){
              if(val =='Does not apply'){
                setState(() {
                  deliveryPlanfive = true;
                });
              }else{
                setState(() {
                  deliveryPlanfive = false;
                });
              }
          },isneedDivider: false,options: ['Cardiologist','Obstetrician','Anaesthetist','A combined team','Does not apply'],),
          MRowTextRadioWidget(title: 'c. At what stage is the anaesthetist involved in the delivery plan',initialValue: deliveryPlanfive ? 'After the first antenatal visit' : null ,onChanged: (val){
            if(val == 'After the first antenatal visit'){
              setState(() {
                deliveryPlanfive = true;
              });
            }else{
              setState(() {
                deliveryPlanfive = false;
              });
            }
          },options: ['Aftershifting the patient to the labour room / OR','The day before planned delivery','Last week of gestation','Last trimester of gestation','After the first antenatal visit'],),
          MSmallText(text: '4. ICU care / HDU care management process',),
          Space(),
          MRowTextRadioWidget(title: 'a. Is there a separate critical care protocol for managing PWWHD',options: ['Yes','Yes partial','No'],onChanged: (val){}, isneedDivider: false,),
          MRowTextRadioWidget(title: 'b. Is there a separate anaesthesia protocol for managing PWWHD',options: ['Yes','Yes partial','No'],onChanged: (val){}, isneedDivider: false),
          MRowTextRadioWidget(title: 'c. Is there a separate intrapartum protocol for managing PWWHD',options: ['Yes','Yes partial','No'],onChanged: (val){},),
          MSmallText(text: '41. Immediate postpartum care',),
          Space(),
          MRowTextRadioWidget(title: 'a. How is ICU stay decided',onChanged: (val){},options: ['Same for all HD patient','Disease-specific, consultant dependent','Disease-specific, protocol guided'],isneedDivider: false,),
          YesNo(title: 'b. Where are the patients who are not kept in ICU soon after delivery, observed?', onChanged: (val){},isneedDivider: false,options: ['ICU','HDU','Labour ward','Others'],
            widget: MTextField(label: 'If others, specify',onChanged: (val){},),),
          MSmallText(text: 'c. What is the average duration of stay in Obstetric ICU unit for a high risk PWWHD after delivery',),
          Space(),
          MRowTextCheckBox(title: 'mWHO I , II',result: (val){},isneedDivider: false,list: ['24-48','< 1 week','> 1 Week','Transfer to cardio after 3-7 days'],),
          MRowTextCheckBox(title: 'mWHO > II',result: (val){},list: ['24-48','< 1 week','> 1 Week','Transfer to cardio after 3-7 days'],),
          MSmallText(text: '42. Post-delivery contraception',),
          Space(),
          MRowTextRadioWidget(title: 'a. What are the post-delivery contraception offered in PWWHD?',onChanged: (val){},options: ['IUCD before discharge','Implants before discharge',' Tubal ligation during LSCS','Tubal ligation before discharge','POPs before discharge','Barrier contraception','Male sterilisation'],),
          MSmallText(text: '43. Adverse event documentation',),
          Space(),
          MRowTextRadioWidget(title: 'a. What are the adverse events documented in the registers of your institutions?', onChanged: (val){},options: ['Severe Maternal Morbidity','Near Miss','Maternal Death','Potentially life-threatening conditions','All of the above'],isneedDivider: false,),
          MRowTextRadioWidget(title: 'b. How is the maternal mortality audit done in your institution', onChanged: (val){},options: ['Internal','External','Both'],isneedDivider: false,),
          MRowTextRadioWidget(title: 'c. Frequency of internal audit', onChanged: (val){},options: ['Once in 15 days','Once a month','Quarterly','Half-yearly']),
          MText(text: 'XIII Management of fetus/neonate',),
          Space(),
          MRowTextRadioWidget(title: '44. What is the protocol for fetal echo in Pregnant women with HD',options: ['Routinely for all PWWHD','Routinely for all PWWHD and any other risk factors for congenital HD infetus (Type II DM etc)','Routinely for all PWW Congenital HD','. Only for patients where fetal HD is suspected during routine anomaly screening','Not done'],),
          MRowTextRadioWidget(title: '45. When is the paediatrician involved in the care process',onChanged: (val){},options: ['Pre-delivery','Post delivery'],),
          MRowTextRadioWidget(title: '45. When is the paediatrician involved in the care process',onChanged: (val){},options: ['Routinely for all PWWHD','Routinely for all PWW CHD','Only for neonates where HD is suspected during clinical evaluation'],),
          MText(text: 'XIV. Discharge process-timing',fontSize: 16,),
          Space(),
          MRowTextRadioWidget(title: '47. Who decides discharge',onChanged: (val){},options: ['Obstetrician','Cardiologist','Combined decision making'],),
          MRowTextRadioWidget(title: '48. When is a PWWHD discharged as a routine?',onChanged: (val){},options: ['3 days','7 days','10 days','14 days','> 14 days'],),
          MRowTextRadioWidget(title: '49. Is the discharge plan common for all PWWHD',onChanged: (val){},options: ['Yes it is a routine protocol for all patients','No, it based on disease severity'],),
          MRowTextRadioWidget(title: '50. Do you obtain a cardiology opinion pre-discharge',onChanged: (val){},options: ['Yesfor all patients','Yes for high risk patients','No'],),
          MRowTextRadioWidget(title: '51. What is your predischarge echocardiogram policy for PWWWHD',onChanged: (val){},options: ['. Predischarge echo is done routinely for all PWWHD','Predischarge echo is done routinely only for high-risk PWWH','Predischarge echo is not done routinely'],),
          MText(text: 'XV. Follow-up system',fontSize: 16,),
          Space(),
          YesNo(title: '52. How are Antenatal / Postnatal patients identified',options: ['Only RCH ID','Only UHID number','Both UHID no RCH ID','Neither','Others'],onChanged: (val){},
          widget: MTextField(label: 'Others specify',onChanged: (val){},),
          ),
          YesNo(title: '53. Do all your patients get RCH ID',onChanged: (val){},options: ['All antenatal patients get RCH ID in the first trimester.','Others'],
          widget: MTextField(label: 'Others specify',onChanged: (val){},),
          ),
          MRowTextRadioWidget(title: '54. How long do you follow up with patients with heart disease after pregnancy termination?',options: ['42 days','90 days','1 year'],onChanged: (val){},),
          MRowTextRadioWidget(title: '55. Who takes responsibility for following up on patients with heart disease after delivery?',options: ['Cardiologist','Obstetrician','MFM','Internal Medicine','Patient'],onChanged: (val){},),
          MRowTextRadioWidget(title: '56. How isthe care transfer of PWWHD from obstetrics to the cardiology department ensured?',options: ['Implemented during Post-delivery CO team meet','Written referral handed over to the patient, and discharge informed to the cardiology team',' Written referral handed over to patient','Oral advice to follow up with cardiology OPD'],onChanged: (val){},),
          MRowTextRadioWidget(title: '57. When are elective cardiac interventions planned after delivery?',options: ['<1 month','1-3 months','3-6 months','> 6 months'],onChanged: (val){},),
          MRowTextRadioWidget(title: '58. Is there any system to follow up on WWHD who are discharged without any contraceptive method?',options: ['Yesthrough in-person visits','Yesthrough telephonic follow up','No'],onChanged: (val){},),
          YesNo(title: '59. How is PWWHD registered in your institution but delivered elsewhere followed up?',onChanged: (val){},options: [' We don’t follow them','Telephonic follow up','Others'],
          widget: MTextField(label: 'Others specify',onChanged: (val){},),
          ),
          MText(text: 'XVI. Pre-existing data collection system/record keeping in the institution',fontSize: 16,),
          Space(),
          MSmallText(text: '60. Data on PWWHD-Heart disease registry',),
          Space(),
          YesNo(title: 'a. Does your institution maintain a separate record of PWWHD who are delivered in your institution?',onChanged: (val){},
          widget: Column(children: [
            MRowTextRadioWidget(title: 'b. Is there any registry/data collection system in place for monitoring PWWHD?', onChanged: (val){},options: ['Yes, Manual entering register','Yes, Computerised','No, data not collected'],isneedDivider: false,),
            MRowTextRadioWidget(title: 'c. Who is in charge of the heart disease register', onChanged: (val){},options: ['. Professor/ Associate Prof','Assistant Professor','Postgraduates','Staff nurses','Senior resident'],isneedDivider: false,),
            MRowTextRadioWidget(title: 'd. Who captures the data in the register', onChanged: (val){},options: ['Dedicated personal available','Insurance personnel','Postgraduates','Assistant Professors'],isneedDivider: false,),
          ],),
          ),
          MSmallText(text: '61. Data retrievalsystem',),
          Space(),
          MRowTextRadioWidget(title: '1. Do you maintain maternal death (MD) and maternal near miss (MNM) data in the department?',isneedDivider: false,onChanged: (val){},options: ['Yes both MD and MNM','Only MD','Neither'],),
          MRowTextRadioWidget(title: '2. What is the mechanism of data retrieval in your institution?',  isneedDivider: false,onChanged: (val){},options: ['Case sheets can be traced from Medical Records department','We make a photocopy of all PWWHD case sheets stored locally in our OBG department','. We store a soft copy of the entire case sheets in our OBG department'],),
          MRowTextRadioWidget(title: '3. If data needs to be retrieved from MRD what information would be needed',  isneedDivider: false ,onChanged: (val){},options: ['Name and date of discharge','Name and date of delivery','Name and PIN number'],),
          MRowTextRadioWidget(title: '4. How many years the high-risk pregnancy case sheets are stored in your Medical Records department?', isneedDivider: false, onChanged: (val){},options: ['1 year','5 year','10 year'],),

        ],),
      ),
    );
  }
}
