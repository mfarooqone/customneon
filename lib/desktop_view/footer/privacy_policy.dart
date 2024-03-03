import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utills/app_colors.dart';
import '../../utills/app_text_style.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              autoLabelText("Privacy Policy"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "This Privacy Policy describes how NeonWill (the “Site” or “we”) collects, uses, and discloses your Personal Information when you visit or make a purchase from the Site."),
              SizedBox(
                height: 5.h,
              ),
              autoLabelText("Contact"),
              SizedBox(
                height: 5.h,
              ),
              autoText(
                  "After reviewing this policy, if you have additional questions, want more information about our privacy practices, or would like to make a complaint, please contact us by e-mail at info@neonwill.com or by mail using the details provided below:"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "253～261 Hennessy Road, FLAT /RM 1502,EASEY COMMERCIAL BUILDING, Wan Chai, Hong Kong Island Hong Kong SAR"),
              SizedBox(
                height: 3.h,
              ),
              autoLabelText("Collecting Personal Information"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "When you visit the Site, we collect certain information about your device, your interaction with the Site, and information necessary to process your purchases. We may also collect additional information if you contact us for customer support. In this Privacy Policy, we refer to any information about an identifiable individual (including the information below) as “Personal Information”. See the list below for more information about what Personal Information we collect and why."),
              SizedBox(
                height: 2.h,
              ),
              autoText("• Device information"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "  1. Purpose of collection: to load the Site accurately for you, and to perform analytics on Site usage to optimize our Site."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "  2. Source of collection: Collected automatically when you access our Site using cookies, log files, web beacons, tags, or pixels."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "  3. Disclosure for a business purpose: shared with our processor Shopify."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "  4. Personal Information collected: version of web browser, IP address, time zone, cookie information, what sites or products you view, search terms,\n      and how you interact with the Site."),
              SizedBox(
                height: 1.h,
              ),
              autoText(
                "• Order information",
              ),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "   1. Purpose of collection: to provide products or services to you to fulfill our contract, to process your payment information, arrange for shipping, and\n       provide you with invoices and/or order confirmations, communicate with you, screen our orders for potential risk or fraud, and when in line with the\n       preferences you have shared with us, provide you with information or advertising relating to our products or services."),
              SizedBox(
                height: 2.h,
              ),
              autoText("  2. Source of collection: collected from you."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "  3. Disclosure for a business purpose: shared with our processor Shopify."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "  4. Personal Information collected: name, billing address, shipping address, payment information (including credit card numbers), email address, and\n      phone number."),
              SizedBox(
                height: 3.h,
              ),
              autoLabelText("Minors"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "The Site is not intended for individuals under the age of 18. We do not intentionally collect Personal Information from children. If you are the parent or guardian and believe your child has provided us with Personal Information, please contact us at the address above to request deletion."),
              SizedBox(
                height: 3.h,
              ),
              autoLabelText("Sharing Personal Information"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "We share your Personal Information with service providers to help us provide our services and fulfill our contracts with you, as described above. For example:"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "• We use Shopify to power our online store. You can read more about how Shopify uses your Personal Information here:\n  https://www.shopify.com/legal/privacy."),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "• We may share your Personal Information to comply with applicable laws and regulations, to respond to a subpoena, search warrant or other lawful\n  request for information we receive, or to otherwise protect our rights."),
              SizedBox(
                height: 3.h,
              ),
              autoLabelText("Behavioural Advertising"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "As described above, we use your Personal Information to provide you with targeted advertisements or marketing communications we believe may be of interest to you. For example:"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "• We use Google Analytics to help us understand how our customers use the Site. You can read more about how Google uses your Personal Information\n  here: https://www.google.com/intl/en/policies/privacy/. You can also opt-out of Google Analytics here: https://tools.google.com/dlpage/gaoptout."),
              SizedBox(
                height: 1.h,
              ),
              autoText(
                  "• We share information about your use of the Site, your purchases, and your interaction with our ads on other websites with our advertising partners. We\n  collect and share some of this information directly with our advertising partners, and in some cases through the use of cookies or other similar\n  technologies (which you may consent to, depending on your location)."),
              SizedBox(
                height: 1.h,
              ),
              autoText(
                  "• We use Shopify Audiences to help us show ads on other websites with our advertising partners to buyers who made purchases with other\n  Shopify merchants and who may also be interested in what we have to offer. We also share information about your use of the Site, your purchases, and\n  the email address associated with your purchases with Shopify Audiences, through which other Shopify merchants may make offers you may be\n  interested in."),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "For more information about how targeted advertising works, you can visit the Network Advertising Initiative’s (“NAI”) educational page at https://www.networkadvertising.org/understanding-online-advertising/how-does-it-work."),
              SizedBox(
                height: 2.h,
              ),
              autoText("You can opt out of targeted advertising by:"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  " • FACEBOOK - https://www.facebook.com/settings/?tab=ads"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  " • GOOGLE - https://www.google.com/settings/ads/anonymous"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  " • BING - https://advertise.bingads.microsoft.com/en-us/resources/policies/personalized-ads"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "Additionally, you can opt out of some of these services by visiting the Digital Advertising Alliance’s opt-out portal at: https://optout.aboutads.info/."),
              SizedBox(
                height: 3.h,
              ),
              autoLabelText("Using Personal Information"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "We use your personal Information to provide our services to you, which includes: offering products for sale, processing payments, shipping and fulfillment of your order, and keeping you up to date on new products, services, and offers."),
              SizedBox(
                height: 3.h,
              ),
              autoLabelText("Lawful basis"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "Pursuant to the General Data Protection Regulation (“GDPR”), if you are a resident of the European Economic Area (“EEA”), we process your personal information under the following lawful bases:"),
              SizedBox(
                height: 3.h,
              ),
              autoText(" • Your consent;"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  " • The performance of the contract between you and the Site;"),
              SizedBox(
                height: 2.h,
              ),
              autoText(" • Compliance with our legal obligations;"),
              SizedBox(
                height: 2.h,
              ),
              autoText(" • To protect your vital interests;"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  " • To perform a task carried out in the public interest;"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  " • For our legitimate interests, which do not override your fundamental rights and freedoms."),
              SizedBox(
                height: 3.h,
              ),
              autoLabelText("Retention"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "When you place an order through the Site, we will retain your Personal Information for our records unless and until you ask us to erase this information. For more information on your right of erasure, please see the ‘Your rights’ section below."),
              SizedBox(
                height: 3.h,
              ),
              autoText("Automatic decision-making"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "If you are a resident of the EEA, you have the right to object to processing based solely on automated decision-making (which includes profiling), when that decision-making has a legal effect on you or otherwise significantly affects you."),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "We engage in fully automated decision-making that has a legal or otherwise significant effect using customer data."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "Our processor Shopify uses limited automated decision-making to prevent fraud that does not have a legal or otherwise significant effect on you."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "Services that include elements of automated decision-making include:"),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  " • Temporary blacklist of IP addresses associated with repeated failed transactions. This blacklist persists for a small number of hours."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  " • Temporary blacklist of credit cards associated with blacklisted IP addresses. This blacklist persists for a small number of days."),
              SizedBox(
                height: 3.h,
              ),
              autoLabelText("Your rights"),
              SizedBox(
                height: 3.h,
              ),
              autoText("GDPR"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "If you are a resident of the EEA, you have the right to access the Personal Information we hold about you, to port it to a new service, and to ask that your Personal Information be corrected, updated, or erased. If you would like to exercise these rights, please contact us through the contact information above."),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "Your Personal Information will be initially processed in Ireland and then will be transferred outside of Europe for storage and further processing, including to Canada and the United States. For more information on how data transfers comply with the GDPR, see Shopify’s GDPR Whitepaper: https://help.shopify.com/en/manual/your-account/privacy/GDPR."),
              SizedBox(
                height: 3.h,
              ),
              autoText("CCPA"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "If you are a resident of California, you have the right to access the Personal Information we hold about you (also known as the ‘Right to Know’), to port it to a new service, and to ask that your Personal Information be corrected, updated, or erased. If you would like to exercise these rights, please contact us through the contact information above."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "If you would like to designate an authorized agent to submit these requests on your behalf, please contact us at the address above."),
              SizedBox(
                height: 3.h,
              ),
              autoText("Cookies"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "A cookie is a small amount of information that’s downloaded to your computer or device when you visit our Site. We use a number of different cookies, including functional, performance, advertising, and social media or content cookies. Cookies make your browsing experience better by allowing the website to remember your actions and preferences (such as login and region selection). This means you don’t have to re-enter this information each time you return to the site or browse from one page to another. Cookies also provide information on how people use the website, for instance whether it’s their first time visiting or if they are a frequent visitor."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "We use the following cookies to optimize your experience on our Site and to provide our services."),
              SizedBox(
                height: 3.h,
              ),
              autoText("Do Not Track"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "Please note that because there is no consistent industry understanding of how to respond to “Do Not Track” signals, we do not alter our data collection and usage practices when we detect such a signal from your browser."),
              SizedBox(
                height: 3.h,
              ),
              autoText("Changes"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "We may update this Privacy Policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal, or regulatory reasons."),
              SizedBox(
                height: 3.h,
              ),
              autoText("Complaints"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "As noted above, if you would like to make a complaint, please contact us by e-mail or by mail using the details provided under “Contact” above."),
              SizedBox(
                height: 2.h,
              ),
              autoText(
                  "If you are not satisfied with our response to your complaint, you have the right to lodge your complaint with the relevant data protection authority. You can contact your local data protection authority, or our supervisory authority here: [Add contact information or website for the data protection authority in your jurisdiction. For example: https://ico.org.uk/make-a-complaint/]"),
              SizedBox(
                height: 3.h,
              ),
              autoText("Last updated: 2022/08/17"),
            ],
          ),
        ),
      ),
    );
  }

  Widget autoLabelText(String text) {
    return AutoSizeText(
      text,
      style:
          AppTextStyle.black3.copyWith(color: AppColors.black, fontSize: 8.sp),
    );
  }

  Widget autoText(String text) {
    return AutoSizeText(
      text,
      style: AppTextStyle.black4,
    );
  }
}
