/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Version : 50534
 Source Host           : localhost
 Source Database       : zhq

 Target Server Version : 50534
 File Encoding         : utf-8

 Date: 04/02/2015 16:49:39 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_class`
-- ----------------------------
BEGIN;
INSERT INTO `t_class` VALUES ('2', '21', '2'), ('3', '222', '2');
COMMIT;

-- ----------------------------
--  Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `idid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(1000) NOT NULL,
  `flid` int(11) NOT NULL,
  `author` varchar(100) NOT NULL,
  `clicks` int(11) NOT NULL,
  PRIMARY KEY (`idid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_news`
-- ----------------------------
BEGIN;
INSERT INTO `t_news` VALUES ('1', '11111', '1', '0-1.jpeg', '2015-04-02 15:34:29', 'dfhjskdhf\r\nkdsjfkls;djfklsdjfds;\r\ndhkjfskaldfjkasjhdfahdflkaehfiheraidvndkxvndknvkadshaskdhfkasdhfkasdhfkasdhfksahdfkhasdkjfhkasdhfkasjdhfkasdhf\r\nfkdsjfksd\r\nkjdsfklfjkl;sdjflsad;jf', '1', 'zhq', '103'), ('2', '22222', '2', '0-2.jpeg', '2015-04-02 14:20:15', '对方会收到了回复就是大黄蜂\r\n看东方时空的肌肤快速的减肥开始对菊赋诗地方了；受到警方离开；说到减肥受到了福建大放送；福建省的龙卷风萨里的；发是的浪费；就受得了；福建撒到了； 发就撒地方；阿三的风景阿萨德了；发撒到了；发简单来说；减肥了；士大夫结束了；阿的；发就是的减肥；是对方接受的；福建省；的分解大师；发是的；福建省的；of\r\n亟待解决的', '2', '周起', '200'), ('3', '3333333', '3', '0-3.jpeg', '2015-04-02 14:20:17', '对方多福多寿多少分dsfsdfsd\r\n fdsf\r\nfsdfsd\r\ndsfdsfsdfdsf', '3', '淡淡的', '50'), ('4', '五台山等9家5A级景区被警告 44家A级景区被摘牌', '新闻啊', '0-4.jpeg', '2015-04-02 14:20:19', '4月2日，国家旅游局在京召开新闻发布会，通报旅游市场秩序专项整治行动的第一阶段情况，部署专项整治第二阶段工作。在专项整治行动的“第一战役”中，各地共有44家A级旅游景区被摘牌，12家旅行社被吊销经营许可证。\r\n\r\n据了解，根据2015年全国旅游工作会议“515战略”的总体部署，紧紧围绕“文明、有序、安全、便利、富民强国”5大目标，国家旅游局组织各地开展了旅游市场秩序专项整治行动，重点整治欺行霸市、垄断市场、非法经营、欺客宰客、强迫消费等行为。2015年1月至春节期间，针对旅游市场秩序存在和游客反映强烈的问题，国家旅游局与公安、工商、物价、交通等相关部门联动，加大旅游市场秩序整治力度。据统计，31个省区市组织开展旅游市场秩序专项检查5490次（其中，开展联合检查2037次），出动检查人员78135人次。有44家A级旅游景区被摘牌，有1家5A级旅游景区被严重警告、9家5A级旅游景区被警告；有12家旅行社被吊销经营许可证、33家旅行社受到责令停业整顿处罚。\r\n\r\n今年春节假期，旅游投诉数量明显下降。春节期间，国家旅游局值班室接到的咨询、投诉电话同比下降60.5%。旅游热点地区市场秩序出现好转，海南等地采取措施，督促各旅行社、旅游景区、旅游星级饭店、旅游购物等企业增强依法经营意识，游客满意度有所提升。但城市“一日游”秩序混乱、在线旅游企业为游客服务与投诉的电话无人接听和解决问题不及时、景区景点中“票中票”和管理服务不到位、旅行社散客拼团强迫消费引发游客不满、酒店预售优惠卡节日期间不兑现等问题仍然是投诉的焦点。\r\n\r\n积极营造文明有序的中国公民出境旅游市场秩序也是第一阶段的重点工作内容之一。国家旅游局一方面通过广播、电视、手机短信、微博、微信等平台，多渠道倡导文明出行，加强对游客文明旅游、理性维权的宣传教育和正面引导；另一方面，要求旅游企业主动作为，强化导游、领队对文明旅游的履职和应对突发事件能力。国家旅游局局长李金早亲自拟定了“讲安全、讲礼仪、讲卫生，不大声喧哗、不乱写乱画、不违法违规”提示语。春节期间，各地组织开展了以出境游为重点，以落实文明旅游“组团关”、“落地关”、“行程关”和“培训关”为主要内容的专项检查。在社会各层面的共同努力下，文明旅游渐成共识。\r\n\r\n根据依法治理旅游市场秩序三年行动方案（2015年），国家旅游局将组织开展专项行动第二战役。以落实依法兴旅、依法', '1', '五台山等9家5A级景区被警告 44家A级景区被摘牌 时政新闻国家旅游局2015-04-02 10:07', '60');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(10) NOT NULL,
  `upass` varchar(10) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', '1', '1', '2015-03-16 09:59:13'), ('7', '2', '2', '2015-03-17 09:50:56'), ('8', '我', '111', '2015-03-17 09:51:17'), ('9', '我我', '1', '2015-03-17 10:15:33'), ('10', 'fgdf', 'gdfgdfg', '2015-03-17 10:49:11');
COMMIT;

-- ----------------------------
--  Table structure for `t_users`
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `upass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_users`
-- ----------------------------
BEGIN;
INSERT INTO `t_users` VALUES ('1', '1', '1'), ('2', '2', '2'), ('3', '3', '3');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
