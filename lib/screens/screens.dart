import 'dart:io' show Platform; //at the top

import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fawz_apps/bloc/summary_trade_bloc.dart';
import 'package:fawz_apps/models/models.dart';
import 'package:fawz_apps/services/services.dart';
import 'package:fawz_apps/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fawz_apps/bloc/blocs.dart';
import 'package:fawz_apps/shared/shared.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

part 'splash/splash_screen.dart';
part 'auth/login_screen.dart';
part 'auth/register_screen.dart';
part 'wrapper/wrapper.dart';
part 'main/main.dart';
part 'main/user_securitas_screen.dart';
part 'main/user_securitas_save_screen.dart';
part 'main/user_disclaimer.dart';
part 'transitions/transition_route.dart';
part 'signals/signals.dart';
part 'summary/summary.dart';
part 'news/news.dart';
part 'news/news_detail.dart';

part 'account/account.dart';
part 'account/account_referral.dart';
part 'account/account_privacy_policy.dart';
part 'account/account_term_conditions.dart';
part 'account/account_history_wallet.dart';

