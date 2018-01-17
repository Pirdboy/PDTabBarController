//
//  PDXMLParser.m
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/17.
//  Copyright © 2018年 pird. All rights reserved.
//

// 测试注释

#import "PDXMLParser.h"
#import <libxml/SAX.h>
#import <libxml2/libxml/tree.h>

#pragma mark -
#pragma mark - XML SAX parse callbacks

void startDocument(void *ctx) {
    
}

// 如果使用 SAX 2.0的话则需按照startElementNsSAX2Func格式声明,可在libxml/parser.h中查看
void startElement(void *ctx, const xmlChar *name, const xmlChar **atts) {
    
}

void characters(void *ctx, const xmlChar *ch, int len) {
    
}

void endDocument(void *ctx) {
    
}



void parse2(){
    
}

#pragma mark -
#pragma mark - XML DOM parse
void parseNode(xmlDocPtr doc, xmlNodePtr node) {
    
    // do some thing with the node
    printf("Node Name:%s\n",node->name);
    xmlAttrPtr attr = node->properties;
    if(attr) {
        printf("属性 %s:%s\n",attr->name,attr->children->content);
    }
    printf("Content:%s\n",node->content);
    printf("Content xmlLength:%u\n",xmlStrlen(node->content));
    if(node->content != NULL) {
        printf("Content length:%d\n",strlen(node->content));
    }
    
    printf("=================\n");
    // do with the node's children
    xmlNodePtr child = node->children;
    while(child) {
        parseNode(doc, child);
        child = child->next;
    }
    
    
//    xmlNodePtr child = node->children;
//    while(child!=NULL) {
//
//        printf("Node Name:%s\n",child->name);
//        xmlAttrPtr attr = child->properties;
//        if(attr) {
//            printf("属性 %s:%s\n",attr->name,attr->children->content);
//        }
//        printf("Content:%s\n",child->content);
//        printf("=================\n");
//        child = child->next;
//    }

}

#pragma mark -
#pragma mark -

@implementation PDXMLParser


void print(){
    printf("C语言方法\n");
}

- (void)parseFile {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"simple" ofType:@"xml"];
    NSString *xml = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    
    const char *fileName = [path cStringUsingEncoding:NSUTF8StringEncoding];
    xmlDocPtr doc;
    xmlNodePtr cur;
    
    // xml含有回车符时解析结果会有问题
    doc = xmlParseFile(fileName);
    if(doc == NULL) {
        fprintf(stderr, "Document not parse successfully...");
        return;
    }
    cur = xmlDocGetRootElement(doc);
    if(cur == NULL) {
        fprintf(stderr, "empty Document");
        xmlFreeDoc(doc);
        return;
    }
    if(xmlStrcmp(cur->name, (const xmlChar *)"root")!=0) {
        fprintf(stderr, "root node != \'root\'");
        xmlFreeDoc(doc);
        return;
    }
    parseNode(doc, cur);
    
    print();
}

- (void)parseNodeWithSAX {
    
}
@end
